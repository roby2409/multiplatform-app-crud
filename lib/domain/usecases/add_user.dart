import 'package:dartz/dartz.dart';
import 'package:multiplatform_app_crud/common/failure.dart';
import 'package:multiplatform_app_crud/domain/entities/user_entity.dart';
import 'package:multiplatform_app_crud/domain/repositories/user_repository.dart';

class AddUser {
  final UserRepository repository;

  AddUser(this.repository);

  Future<Either<Failure, UserEntity>> execute(UserEntity newUser) {
    return repository.addUser(newUser);
  }
}
