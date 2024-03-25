import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multiplatform_app_crud/common/exception.dart';

import 'failure.dart';

abstract class HelperProcess {
  Future<http.Response> returnResponse(http.Response response);
  Future<Failure> getFailureFromException(Object e);
}

class HelperProcessImpl implements HelperProcess {
  @override
  Future<http.Response> returnResponse(http.Response response) async {
    var responseJson = response.body;

    String? mappingMessage(String body) {
      try {
        final map = json.decode(body);
        return map["message"];
      } catch (_) {
        return null;
      }
    }

    switch (response.statusCode) {
      case 200:
      case 201:
        return response;
      case 400:
        throw BadRequestException(
            mappingMessage(responseJson) ?? "Bad request");
      case 403:
        throw ForbidenAccessException(
            mappingMessage(responseJson) ?? "Forbidden access");
      case 405:
        throw BadRequestException(
            mappingMessage(responseJson) ?? "Method not allowed");
      case 404:
        throw NotFoundException(mappingMessage(responseJson) ?? "Not Found");
      case 422:
        final map = json.decode(responseJson);
        final errors = map['errors'];
        debugPrint(errors.toString());
        throw InvalidInputException(
            mappingMessage(responseJson) ?? "Invalid input", errors);
      case 429:
        throw ServerException("Too Many Request");
      case 401: // session habis
        throw UnauthorisedException(
            mappingMessage(responseJson) ?? "Unauthorized session");
      case 408: // session habis
        throw const SocketException("socket exception");
      case 500:
        throw ServerException("Internal server error");
      default:
        throw FetchDataException(
            "Mohon maaf atas ketidaknyamanan nya, telah terjadi kesalahan pada sistem kami. Kami akan memperbaiki nya segera.");
    }
  }

  @override
  Future<Failure> getFailureFromException(Object e) async {
    if (e is ExceptionFromCannotProcess) {
      return CommonFailure(e.errorMessage, e);
    } else if (e is InvalidInputException) {
      return ValidationFailure(e.message, e.errors);
    } else if (e is DatabaseException) {
      return DatabaseFailure(e.message);
    } else if (e is CacheException) {
      return CacheFailure(e.message);
    } else if (e is FetchDataException) {
      return FetchFailure(e.message);
    } else if (e is TimeoutException) {
      String customMessage =
          "Koneksi Gagal. Terjadi kesalahan dalam memuat data dari server.";
      return ConnectionFailure(customMessage);
    } else {
      // Handle other types of exceptions or unknown exceptions
      return ServerFailure(e.toString());
    }
  }
}
