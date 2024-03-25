import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:multiplatform_app_crud/data/datasources/user_remote_data_source.dart';
import 'package:multiplatform_app_crud/domain/repositories/user_repository.dart';

@GenerateMocks(
  [
    UserRepository,
    UserRemoteDataSource,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
