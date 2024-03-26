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

  const ListAllUsersLoaded(
    this.users,
  );

  ListAllUsersLoaded copyWith({
    List<UserEntity>? searchResult,
  }) {
    return ListAllUsersLoaded(
      searchResult ?? users,
    );
  }

  @override
  List<Object> get props => [users];
}

class ListAllUsersFailure extends ListAllUsersState {
  final Failure failure;

  const ListAllUsersFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
