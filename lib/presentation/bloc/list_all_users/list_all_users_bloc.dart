import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:multiplatform_app_crud/common/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiplatform_app_crud/domain/entities/user_entity.dart';
import 'package:multiplatform_app_crud/domain/usecases/get_all_user.dart';

part 'list_all_users_event.dart';
part 'list_all_users_state.dart';

class ListAllUsersBloc extends Bloc<ListAllUsersEvent, ListAllUsersState> {
  final GetAllUser _getAllUser;

  List<UserEntity> usersLoaded = [];
  ListAllUsersBloc(
    this._getAllUser,
  ) : super(ListAllUsersInitial()) {
    on<FetchAllPengguna>((event, emit) async {
      emit(ListAllUsersLoading());
      final resultLoadAllPengguna = await _getAllUser.execute();
      resultLoadAllPengguna.fold((failure) {
        emit(ListAllUsersFailure(failure));
      }, (allUsers) {
        usersLoaded = allUsers;
        emit(ListAllUsersLoaded(usersLoaded));
        if (allUsers.isEmpty) {
          emit(const ListAllUsersEmpty('Data Not Found'));
        }
      });
    });

    on<FilterByCity>(
      (event, emit) async {
        if (state is ListAllUsersLoaded) {
          final currentState = (state as ListAllUsersLoaded);
          final resultFilter = usersLoaded
              .where((element) =>
                  element.city
                      ?.toLowerCase()
                      .contains(event.city.toLowerCase()) ??
                  false)
              .toList();
          if (resultFilter.isNotEmpty) {
            final updatedState =
                currentState.copyWith(searchResult: resultFilter);
            emit(updatedState);
          } else {
            emit(const ListAllUsersEmpty("Data not found"));
          }
        } else {
          emit(ListAllUsersLoaded(usersLoaded));
        }
      },
      transformer: sequential(),
    );
  }
}
