import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:multiplatform_app_crud/common/exception.dart';
import 'package:multiplatform_app_crud/common/failure.dart';
import 'package:multiplatform_app_crud/data/models/user.dart';
import 'package:multiplatform_app_crud/data/repositories/user_repository_impl.dart';
import 'package:multiplatform_app_crud/domain/entities/user_entity.dart';
import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late UserRepositoryImpl repository;
  late MockUserRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockUserRemoteDataSource();
    repository = UserRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  final tUser = UserEntity(
      name: 'Yovi',
      address: 'Tangerang',
      email: 'yovi@gmail.com',
      phoneNumber: '08123123',
      city: 'Tangerang',
      id: "1");

  final tUserModel = User.fromEntity(tUser);
  final tUserAddedModel = User.fromEntity(userAdded);
  final tUserModelList = <User>[tUserModel];
  final tUserList = <UserEntity>[tUser];
  group('user repository has fetch all user, add user', () {
    group('condition fetch user', () {
      test(
          'should return all users when the call to fetch user data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.getAllUsers())
            .thenAnswer((_) async => tUserModelList);
        // act
        final result = await repository.getAllUsers();
        // assert
        verify(mockRemoteDataSource.getAllUsers());

        final resultList = result.getOrElse(() => []);
        expect(resultList, tUserList);
      });

      test(
          'should return server failure when the call to fetch user data source is unsuccessful',
          () async {
        // arrange
        when(mockRemoteDataSource.getAllUsers())
            .thenThrow(ServerException("failed in server"));
        // act
        final result = await repository.getAllUsers();
        // assert
        verify(mockRemoteDataSource.getAllUsers());
        expect(result, equals(const Left(ServerFailure('failed in server'))));
      });
    });

    group('condition add user', () {
      test(
          'should return success message when the call to post user data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.addUser(tUserAddedModel.toJson()))
            .thenAnswer((_) async => tUserAddedModel);
        // act
        final result = await repository.addUser(tUserAddedModel.toEntity());
        // assert
        expect(result, Right(userAdded));
      });

      test(
          'should return server failure when the call to post user data source is successful',
          () async {
        // arrange
        when(mockRemoteDataSource.addUser(tUserModel.toJson()))
            .thenThrow(ServerException('Failed to add User'));
        // act
        final result = await repository.addUser(tUserModel.toEntity());
        // assert
        expect(result, const Left(ServerFailure('Failed to add User')));
      });
    });
  });
}
