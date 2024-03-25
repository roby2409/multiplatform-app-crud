import 'package:flutter_test/flutter_test.dart';
import 'package:multiplatform_app_crud/data/models/city.dart';
import 'package:multiplatform_app_crud/domain/entities/city_entity.dart';

void main() {
  final tCityModel = City(
      name: 'Tiko',
      address: 'Tangerang',
      email: 'tiko@gmail.com',
      phoneNumber: '0849098434',
      city: 'Tangerang',
      id: "15");

  final tCityModelJustNameId = City(name: 'Tangerang', id: "15");

  final tCity = CityEntity(name: 'Tangerang', id: "15");

  group('condition response of city', () {
    test('when city response has property city keep city', () async {
      final result = tCityModel.toEntity();
      expect(result, tCity);
    });

    test('when city response has without city take name', () async {
      final result = tCityModelJustNameId.toEntity();
      expect(result, tCity);
    });
  });
}
