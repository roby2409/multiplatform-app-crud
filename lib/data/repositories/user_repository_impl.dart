import 'package:dartz/dartz.dart';
import 'package:multiplatform_app_crud/common/exception.dart';
import 'package:multiplatform_app_crud/common/failure.dart';
import 'package:multiplatform_app_crud/data/datasources/user_remote_data_source.dart';
import 'package:multiplatform_app_crud/data/models/user.dart';
import 'package:multiplatform_app_crud/domain/entities/user_entity.dart';
import 'package:multiplatform_app_crud/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers() async {
    try {
      final result = await remoteDataSource.getAllUsers();
      final toList = result.map((model) => model.toEntity()).toList();
      return Right(toList);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> addUser(UserEntity user) async {
    try {
      final payloadUser = User.fromEntity(user);
      final result = await remoteDataSource.addUser(payloadUser.toJson());
      return Right(result.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }
}
