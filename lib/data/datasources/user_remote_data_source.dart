import 'package:multiplatform_app_crud/common/config.dart';
import 'package:multiplatform_app_crud/common/helper_process.dart';
import 'package:multiplatform_app_crud/data/models/user.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<List<User>> getAllUsers();
  Future<String> addUser(Map<String, dynamic> payload);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  final HelperProcess helperProcess;

  UserRemoteDataSourceImpl({required this.client, required this.helperProcess});

  @override
  Future<List<User>> getAllUsers() async {
    final request = await client
        .get(Uri.parse('${baseUrl}user'))
        .timeout(const Duration(seconds: secondTimeout));

    final response = await helperProcess.returnResponse(request);
    return userFromJson(response.body);
  }

  @override
  Future<String> addUser(Map<String, dynamic> payload) async {
    final request = await client
        .post(Uri.parse('${baseUrl}user'), body: payload)
        .timeout(const Duration(seconds: secondTimeout));
    await helperProcess.returnResponse(request);
    return 'Success add user';
  }
}
