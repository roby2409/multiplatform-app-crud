import 'package:dartz/dartz.dart';
import 'package:multiplatform_app_crud/common/exception.dart';
import 'package:multiplatform_app_crud/common/failure.dart';
import 'package:multiplatform_app_crud/data/datasources/city_remote_data_source.dart';
import 'package:multiplatform_app_crud/domain/entities/city_entity.dart';
import 'package:multiplatform_app_crud/domain/repositories/city_repository.dart';

class CityRepositoryImpl implements CityRepository {
  final CityRemoteDataSource remoteDataSource;

  CityRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<CityEntity>>> getAllCities() async {
    try {
      final result = await remoteDataSource.getAllCities();
      final toList = result.map((model) => model.toEntity()).toList();
      return Right(toList);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }
}
