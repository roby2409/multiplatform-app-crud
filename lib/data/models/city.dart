import 'dart:convert';
import 'package:multiplatform_app_crud/domain/entities/city_entity.dart';

List<City> cityFromJson(String str) =>
    List<City>.from(json.decode(str).map((x) => City.fromJson(x)));

class City {
  String name;
  String id;
  String? address;
  String? email;
  String? phoneNumber;
  String? city;

  City({
    required this.name,
    required this.id,
    this.address,
    this.email,
    this.phoneNumber,
    this.city,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"],
        id: json["id"],
        address: json["address"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        city: json["city"],
      );

  CityEntity toEntity() {
    return CityEntity(name: city ?? name, id: id);
  }
}
