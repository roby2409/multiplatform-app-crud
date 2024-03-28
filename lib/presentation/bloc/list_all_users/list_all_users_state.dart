part of 'list_all_users_bloc.dart';

abstract class ListAllUsersState extends Equatable {
  const ListAllUsersState();

  @override
  List<Object> get props => [];
}

class ListAllUsersInitial extends ListAllUsersState {}

class ListAllUsersLoading extends ListAllUsersState {}

class ListAllUsersEmpty extends ListAllUsersState {
  final String message;

  const ListAllUsersEmpty(this.message);

  @override
  List<Object> get props => [message];
}

class ListAllUsersLoaded extends ListAllUsersState {
  final List<UserEntity> users;
  final bool isSortedAscending;

  const ListAllUsersLoaded(this.users, {this.isSortedAscending = false});

  ListAllUsersLoaded copyWith(
      {List<UserEntity>? searchResult, bool? newValueSort}) {
    return ListAllUsersLoaded(searchResult ?? users,
        isSortedAscending: newValueSort ?? isSortedAscending);
  }

  @override
  List<Object> get props => [users, isSortedAscending];
}

class ListAllUsersFailure extends ListAllUsersState {
  final Failure failure;

  const ListAllUsersFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
