part of 'cities_bloc.dart';

abstract class CitiesState extends Equatable {
  const CitiesState();

  @override
  List<Object> get props => [];
}

class CitiesInitial extends CitiesState {}

class CitiesLoading extends CitiesState {}

class CitiesError extends CitiesState {
  final String message;

  const CitiesError(this.message);

  @override
  List<Object> get props => [message];
}

class CitiesHasData extends CitiesState {
  final List<CityEntity> cities;

  const CitiesHasData(this.cities);

  @override
  List<Object> get props => [cities];
}
