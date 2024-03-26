import 'package:dartz/dartz.dart';
import 'package:multiplatform_app_crud/common/failure.dart';
import 'package:multiplatform_app_crud/domain/entities/city_entity.dart';
import 'package:multiplatform_app_crud/domain/repositories/city_repository.dart';

class GetAllCities {
  final CityRepository repository;

  GetAllCities(this.repository);

  Future<Either<Failure, List<CityEntity>>> execute() {
    return repository.getAllCities();
  }
}
