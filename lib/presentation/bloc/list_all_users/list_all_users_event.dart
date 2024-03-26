part of 'list_all_users_bloc.dart';

abstract class ListAllUsersEvent extends Equatable {
  const ListAllUsersEvent();
  @override
  List<Object?> get props => [];
}

class FetchAllPengguna extends ListAllUsersEvent {}

class FilterByCity extends ListAllUsersEvent {
  final String city;

  const FilterByCity(
    this.city,
  );

  @override
  List<Object> get props => [city];
}
