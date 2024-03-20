import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserEntity extends Equatable {
  String? name;
  String? id;
  String? address;
  String? email;
  String? phoneNumber;
  String? city;

  UserEntity({
    required this.name,
    required this.id,
    this.address,
    this.email,
    this.phoneNumber,
    this.city,
  });

  @override
  List<Object?> get props => [
        name,
        id,
        address,
        email,
        phoneNumber,
        city,
      ];
}
