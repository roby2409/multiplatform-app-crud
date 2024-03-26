import 'package:get_it/get_it.dart';
import 'common/helper_process.dart';
import 'common/http_ssl_pinning.dart';
import 'data/datasources/user_remote_data_source.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/get_all_user.dart';
import 'presentation/bloc/list_all_users/list_all_users_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerLazySingleton<ListAllUsersBloc>(
      () => ListAllUsersBloc(locator()));
  // usecase
  locator.registerLazySingleton<GetAllUser>(() => GetAllUser(locator()));

  // repository
  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(remoteDataSource: locator()));

  // data sources
  locator.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(client: locator(), helperProcess: locator()),
  );

  // helper
  locator.registerLazySingleton<HelperProcess>(() => HelperProcessImpl());

  // external dependencies
  locator.registerLazySingleton(() => HttpSSLPinning.client);
}
