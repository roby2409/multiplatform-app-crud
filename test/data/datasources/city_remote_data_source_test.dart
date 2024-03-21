import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:multiplatform_app_crud/common/config.dart';
import 'package:multiplatform_app_crud/common/helper_process.dart';
import 'package:multiplatform_app_crud/data/datasources/city_remote_data_source.dart';
import 'package:multiplatform_app_crud/data/models/city.dart';
import 'package:http/http.dart' as http;
import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late HelperProcessImpl helperProcessImpl;
  late CityRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    helperProcessImpl = HelperProcessImpl();
    mockHttpClient = MockHttpClient();
    dataSource = CityRemoteDataSourceImpl(
        client: mockHttpClient, helperProcess: helperProcessImpl);
  });

  group('Get All Cities', () {
    final tCitiList = cityFromJson(readJson('dummy_data/cities.json'));
    test('should return list of City Model when the response code is 200',
        () async {
      // arrange
      when(
        mockHttpClient.get(Uri.parse('${baseUrl}city')),
      ).thenAnswer(
        (_) async => http.Response(
          readJson('dummy_data/cities.json'),
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          },
        ),
      );
      // act
      final result = await dataSource.getAllCities();
      // assert
      expect(result, equals(tCitiList));
    });
  });
}
