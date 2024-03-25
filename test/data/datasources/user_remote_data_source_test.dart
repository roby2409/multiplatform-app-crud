import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:multiplatform_app_crud/common/config.dart';
import 'package:multiplatform_app_crud/common/exception.dart';
import 'package:multiplatform_app_crud/common/helper_process.dart';
import 'package:multiplatform_app_crud/data/datasources/user_remote_data_source.dart';
import 'package:multiplatform_app_crud/data/models/user.dart';
import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late HelperProcessImpl helperProcessImpl;
  late UserRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    helperProcessImpl = HelperProcessImpl();
    mockHttpClient = MockHttpClient();
    dataSource = UserRemoteDataSourceImpl(
        client: mockHttpClient, helperProcess: helperProcessImpl);
  });

  group('Get All Users', () {
    final tUserList = allUserFromJson(readJson('dummy_data/users.json'));

    test('should return list of User Model when the response code is 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(Uri.parse('${baseUrl}user')),
      ).thenAnswer(
        (_) async => http.Response(
          readJson('dummy_data/users.json'),
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
        ),
      );
      // act
      final result = await dataSource.getAllUsers();
      // assert
      expect(result, equals(tUserList));
    });

    test(
        'should throw a ServerException when the response code is 500 or other',
        () async {
      // arrange
      when(mockHttpClient.get(Uri.parse('${baseUrl}user')))
          .thenAnswer((_) async => http.Response('Internal server error', 500));
      // act
      final call = dataSource.getAllUsers();
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });

  group('Add User', () {
    final tNewUser = userFromJson(readJson('dummy_data/new_user.json'));

    test(
        'should return new User Model when the response code is 200 after user added',
        () async {
      // arrange
      when(
        mockHttpClient.post(Uri.parse('${baseUrl}user'),
            body: tNewUser.toJson()),
      ).thenAnswer(
        (_) async => http.Response(
          readJson('dummy_data/new_user.json'),
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
        ),
      );
      // act
      final result = await dataSource.addUser(tNewUser.toJson());
      // assert
      expect(result, equals(tNewUser));
    });

    test(
        'should throw a ServerException when the response code is 500 or other',
        () async {
      // arrange
      when(mockHttpClient.post(Uri.parse('${baseUrl}user'),
              body: tNewUser.toJson()))
          .thenAnswer((_) async => http.Response('Internal server error', 500));
      // act
      final call = dataSource.addUser(tNewUser.toJson());
      // assert
      expect(() => call, throwsA(isA<ServerException>()));
    });
  });
}
