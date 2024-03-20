import 'package:flutter_test/flutter_test.dart';
import 'package:multiplatform_app_crud/data/models/user.dart';
import 'package:multiplatform_app_crud/domain/entities/user_entity.dart';

void main() {
  final tUserModel = User(
      name: 'Yovi',
      address: 'Tangerang',
      email: 'yovi@gmail.com',
      phoneNumber: '08123123',
      city: 'Tangerang',
      id: "1");

  final tUser = UserEntity(
      name: 'Yovi',
      address: 'Tangerang',
      email: 'yovi@gmail.com',
      phoneNumber: '08123123',
      city: 'Tangerang',
      id: "1");

  test('user entity should be same with result user model to entity', () async {
    final result = tUserModel.toEntity();
    expect(result, tUser);
  });
}
