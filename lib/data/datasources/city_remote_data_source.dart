import 'package:multiplatform_app_crud/common/config.dart';
import 'package:multiplatform_app_crud/common/helper_process.dart';
import 'package:multiplatform_app_crud/data/models/city.dart';
import 'package:http/http.dart' as http;

abstract class CityRemoteDataSource {
  Future<List<City>> getAllCities();
}

class CityRemoteDataSourceImpl implements CityRemoteDataSource {
  final http.Client client;
  final HelperProcess helperProcess;

  CityRemoteDataSourceImpl({required this.client, required this.helperProcess});

  @override
  Future<List<City>> getAllCities() async {
    final request = await client
        .get(Uri.parse('${baseUrl}city'))
        .timeout(const Duration(seconds: secondTimeout));

    final response = await helperProcess.returnResponse(request);
    return cityFromJson(response.body);
  }
}
