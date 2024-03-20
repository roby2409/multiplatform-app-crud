import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CityEntity extends Equatable {
  String name;
  String id;

  CityEntity({
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [
        name,
        id,
      ];
}
