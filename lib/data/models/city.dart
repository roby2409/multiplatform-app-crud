import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:multiplatform_app_crud/domain/entities/city_entity.dart';

List<City> cityFromJson(String str) =>
    List<City>.from(json.decode(str).map((x) => City.fromJson(x)));

class City extends Equatable {
  final String name;
  final String id;
  final String? address;
  final String? email;
  final String? phoneNumber;
  final String? city;

  const City({
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

  @override
  List<Object?> get props => [];
}
