import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multiplatform_app_crud/domain/entities/city_entity.dart';
import 'package:multiplatform_app_crud/domain/usecases/get_all_cities.dart';

part 'cities_event.dart';
part 'cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  final GetAllCities _getCities;
  CitiesBloc(this._getCities) : super(CitiesInitial()) {
    on<CitiesEvent>((event, emit) async {
      emit(CitiesLoading());
      final result = await _getCities.execute();
      result.fold((failure) => emit(CitiesError(failure.message)),
          (citiesData) {
        emit(CitiesHasData(citiesData));
      });
    });
  }
}
