import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:multiplatform_app_crud/domain/entities/user_entity.dart';

List<User> allUserFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User extends Equatable {
  final String? name;
  final String? address;
  final String? email;
  final String? phoneNumber;
  final String? city;
  final String? id;

  const User(
      {this.name,
      this.address,
      this.email,
      this.phoneNumber,
      this.city,
      this.id});

  factory User.fromEntity(UserEntity user) => User(
        name: user.name,
        address: user.address,
        email: user.email,
        phoneNumber: user.phoneNumber,
        city: user.city,
        id: user.id,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        address: json["address"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "email": email,
        "phoneNumber": phoneNumber,
        "city": city
      };

  UserEntity toEntity() {
    return UserEntity(
      name: name,
      address: address,
      email: email,
      phoneNumber: phoneNumber,
      city: city,
      id: id,
    );
  }

  @override
  List<Object?> get props => [
        name,
        address,
        email,
        phoneNumber,
        city,
        id,
      ];
}
