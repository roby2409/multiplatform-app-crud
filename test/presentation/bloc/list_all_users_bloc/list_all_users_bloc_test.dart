import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multiplatform_app_crud/common/failure.dart';
import 'package:multiplatform_app_crud/domain/entities/user_entity.dart';
import 'package:multiplatform_app_crud/domain/usecases/get_all_user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiplatform_app_crud/presentation/bloc/list_all_users/list_all_users_bloc.dart';

import 'list_all_users_bloc_test.mocks.dart';

@GenerateMocks([GetAllUser])
void main() {
  late ListAllUsersBloc userBloc;
  late MockGetAllUser mockGetListAllUsers;

  setUp(() {
    mockGetListAllUsers = MockGetAllUser();
    userBloc = ListAllUsersBloc(mockGetListAllUsers);
  });

  final tUsersModel = UserEntity(
      name: 'Yovi',
      address: 'Tangerang',
      email: 'yovi@gmail.com',
      phoneNumber: '08123123',
      city: 'Tangerang',
      id: "1");
  final tUsersModelSecond = UserEntity(
      name: 'Vina panduwinata',
      address: 'sukawinatan',
      email: 'vina@gmail.com',
      phoneNumber: '08123123',
      city: 'Palembang',
      id: "2");
  final tUsersList = <UserEntity>[tUsersModel, tUsersModelSecond];
  final filteredUsersList = <UserEntity>[tUsersModelSecond];

  group('Fetch Users', () {
    test('Initial state should be empty', () {
      expect(userBloc.state, ListAllUsersInitial());
    });

    blocTest<ListAllUsersBloc, ListAllUsersState>(
      'Should emit [ListAllUsersLoading, ListAllUsersLoaded] when data is gotten successfully',
      build: () {
        when(mockGetListAllUsers.execute())
            .thenAnswer((_) async => Right(tUsersList));
        return userBloc;
      },
      act: (bloc) => bloc.add(FetchAllPengguna()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        ListAllUsersLoading(),
        ListAllUsersLoaded(tUsersList),
      ],
      verify: (bloc) {
        verify(mockGetListAllUsers.execute());
      },
    );

    blocTest<ListAllUsersBloc, ListAllUsersState>(
      'Should emit [ListAllUsersLoading, ListAllUsersLoaded[], ListAllUsersEmpty] when data is empty',
      build: () {
        when(mockGetListAllUsers.execute())
            .thenAnswer((_) async => const Right(<UserEntity>[]));
        return userBloc;
      },
      act: (bloc) => bloc.add(FetchAllPengguna()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        ListAllUsersLoading(),
        const ListAllUsersLoaded(<UserEntity>[]),
        const ListAllUsersEmpty('Data Not Found'),
      ],
      verify: (bloc) {
        verify(mockGetListAllUsers.execute());
      },
    );

    blocTest<ListAllUsersBloc, ListAllUsersState>(
      'Should emit [ListAllUsersLoading, ListAllUsersError] when data is unsuccessful',
      build: () {
        when(mockGetListAllUsers.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return userBloc;
      },
      act: (bloc) => bloc.add(FetchAllPengguna()),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        ListAllUsersLoading(),
        const ListAllUsersFailure(ServerFailure('Server Failure')),
      ],
      verify: (bloc) {
        verify(mockGetListAllUsers.execute());
      },
    );
  });

  group('Filters Users', () {
    blocTest<ListAllUsersBloc, ListAllUsersState>(
      'should emit ListAllUsersLoading, ListAllUsersLoaded on SearchUsers event with matching users',
      build: () {
        userBloc.usersLoaded = filteredUsersList;
        return userBloc;
      },
      act: (bloc) => bloc.add(
          const SearchUsers('Palembang')), // User with 'Palembang' city exists
      expect: () => [
        ListAllUsersLoaded(filteredUsersList),
      ],
    );
  });
}
