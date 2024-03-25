class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);
}

class InvalidInputException implements Exception {
  final String message;
  final Map<String, dynamic> errors;

  InvalidInputException(this.message, this.errors);
}

class FetchDataException implements Exception {
  final String message;

  FetchDataException(this.message);
}

abstract class ExceptionFromCannotProcess implements Exception {
  String get errorMessage;
}

class BadRequestException implements ExceptionFromCannotProcess {
  @override
  final String errorMessage;

  BadRequestException(this.errorMessage);

  @override
  String toString() => 'Bad Request: $errorMessage';
}

class ForbidenAccessException implements ExceptionFromCannotProcess {
  @override
  final String errorMessage;

  ForbidenAccessException(this.errorMessage);

  @override
  String toString() => 'Bad Request: $errorMessage';
}

class NotFoundException implements ExceptionFromCannotProcess {
  @override
  final String errorMessage;

  NotFoundException(this.errorMessage);

  @override
  String toString() => 'Not Found: $errorMessage';
}

class UnauthorisedException implements ExceptionFromCannotProcess {
  @override
  final String errorMessage;

  UnauthorisedException(this.errorMessage);

  @override
  String toString() => 'Unauthorized: $errorMessage';
}

class ServerException implements ExceptionFromCannotProcess {
  @override
  final String errorMessage;

  ServerException(this.errorMessage);

  @override
  String toString() => 'Unauthorized: $errorMessage';
}
