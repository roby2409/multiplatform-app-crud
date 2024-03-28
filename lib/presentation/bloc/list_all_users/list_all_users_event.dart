part of 'list_all_users_bloc.dart';

abstract class ListAllUsersEvent extends Equatable {
  const ListAllUsersEvent();
  @override
  List<Object?> get props => [];
}

class FetchAllPengguna extends ListAllUsersEvent {}

class SearchUsers extends ListAllUsersEvent {
  final String nameUser;

  const SearchUsers(
    this.nameUser,
  );

  @override
  List<Object> get props => [nameUser];
}

class FilterByCity extends ListAllUsersEvent {
  final List<String> cities;

  const FilterByCity(
    this.cities,
  );

  @override
  List<Object> get props => [cities];
}

class SortUsers extends ListAllUsersEvent {
  final bool sortAscending;

  const SortUsers(this.sortAscending);

  @override
  List<Object?> get props => [sortAscending];
}
