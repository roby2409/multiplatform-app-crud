import 'package:dartz/dartz.dart';
import 'package:multiplatform_app_crud/common/failure.dart';
import 'package:multiplatform_app_crud/domain/entities/user_entity.dart';
import 'package:multiplatform_app_crud/domain/repositories/user_repository.dart';

class GetAllUser {
  final UserRepository repository;

  GetAllUser(this.repository);

  Future<Either<Failure, List<UserEntity>>> execute() {
    return repository.getAllUsers();
  }
}
