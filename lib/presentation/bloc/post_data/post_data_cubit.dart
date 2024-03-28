import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiplatform_app_crud/data/models/user.dart';
import 'package:multiplatform_app_crud/domain/entities/user_entity.dart';
import 'package:multiplatform_app_crud/domain/usecases/add_user.dart';

part 'post_data_state.dart';

class PostDataCubit extends Cubit<PostDataState> {
  final AddUser _addUser;
  PostDataCubit(this._addUser) : super(PostDataState(isLoading: false));

  void postUserData({
    required String name,
    required String address,
    required String email,
    required String phoneNumber,
    required String city,
  }) async {
    emit(PostDataState(isLoading: true));
    final newUserPost = User(
      name: name,
      address: address,
      email: email,
      phoneNumber: phoneNumber,
      city: city,
    );
    final resultLoadAllPengguna =
        await _addUser.execute(newUserPost.toEntity());
    resultLoadAllPengguna.fold((failure) {
      emit(PostDataState(isLoading: false, errorMessage: failure.message));
    }, (newUser) {
      emit(PostDataState(isLoading: false, newUser: newUser));
    });
  }
}
