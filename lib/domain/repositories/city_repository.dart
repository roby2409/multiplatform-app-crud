import 'package:dartz/dartz.dart';
import 'package:multiplatform_app_crud/common/failure.dart';
import 'package:multiplatform_app_crud/domain/entities/city_entity.dart';

abstract class CityRepository {
  Future<Either<Failure, List<CityEntity>>> getAllCities();
}
