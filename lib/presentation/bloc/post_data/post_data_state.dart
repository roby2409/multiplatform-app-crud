part of 'post_data_cubit.dart';

class PostDataState {
  final bool isLoading;
  final String? errorMessage;
  final UserEntity? newUser; // Add this property to hold the new user data

  PostDataState({required this.isLoading, this.errorMessage, this.newUser});
}
