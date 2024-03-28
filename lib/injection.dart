import 'package:get_it/get_it.dart';
import 'package:multiplatform_app_crud/data/datasources/city_remote_data_source.dart';
import 'package:multiplatform_app_crud/domain/repositories/city_repository.dart';
import 'package:multiplatform_app_crud/domain/usecases/add_user.dart';
import 'package:multiplatform_app_crud/presentation/bloc/cities/cities_bloc.dart';
import 'package:multiplatform_app_crud/presentation/bloc/post_data/post_data_cubit.dart';
import 'common/helper_process.dart';
import 'common/http_ssl_pinning.dart';
import 'data/datasources/user_remote_data_source.dart';
import 'data/repositories/city_repository_impl.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/get_all_cities.dart';
import 'domain/usecases/get_all_user.dart';
import 'presentation/bloc/list_all_users/list_all_users_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerLazySingleton<ListAllUsersBloc>(
      () => ListAllUsersBloc(locator()));
  locator.registerLazySingleton<CitiesBloc>(() => CitiesBloc(locator()));
  locator.registerLazySingleton<PostDataCubit>(() => PostDataCubit(locator()));
  // usecase
  locator.registerLazySingleton<GetAllUser>(() => GetAllUser(locator()));
  locator.registerLazySingleton<AddUser>(() => AddUser(locator()));
  locator.registerLazySingleton<GetAllCities>(() => GetAllCities(locator()));

  // repository
  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: locator()));
  locator.registerLazySingleton<CityRepository>(
      () => CityRepositoryImpl(remoteDataSource: locator()));

  // data sources
  locator.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(client: locator(), helperProcess: locator()),
  );
  locator.registerLazySingleton<CityRemoteDataSource>(
    () => CityRemoteDataSourceImpl(client: locator(), helperProcess: locator()),
  );

  // helper
  locator.registerLazySingleton<HelperProcess>(() => HelperProcessImpl());

  // external dependencies
  locator.registerLazySingleton(() => HttpSSLPinning.client);
}
