import 'package:dartz/dartz.dart';
import 'package:flutter_first_tdd_app/cor/networl/network_Info.dart';
import 'package:flutter_first_tdd_app/features/login/data/data_sources/Login_data_sources.dart';
import 'package:flutter_first_tdd_app/features/login/data/models/Login_model.dart';
import 'package:flutter_first_tdd_app/features/login/data/repositories/Login_repositorie.dart';
import 'package:flutter_first_tdd_app/features/login/domain/entities/login_entities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLoginDataSource extends Mock implements LoginDataSources {}

class MockNetWorkInfo extends Mock implements NetworkInfo {}

void main() {
  LoginRepositoriesImpl repository;
  MockLoginDataSource mockLoginDataSource;
  MockNetWorkInfo mockNetWorkInfo;
  final username = 'eve.holt@reqres.in';
  final password = 'pistol';
  final tLoginModel = LoginModel(Password: password, username: username);
  final tLogin = Login(password: username,username: password);
  setUp(() {
    mockLoginDataSource = MockLoginDataSource();
    mockNetWorkInfo = MockNetWorkInfo();
    repository = LoginRepositoriesImpl(
        loginDataSources: mockLoginDataSource, networkInfo: mockNetWorkInfo);
  });
  test("device is offline",
    () async {
    // arrange
    when(mockNetWorkInfo.isConnected).thenAnswer((_) async=> false);
    // act

    // assert

  });
  test("should check if the device is online",
    () async {
    // arrange
    when(mockNetWorkInfo.isConnected).thenAnswer((_) async=> true);
    // act
    repository.getConcreteLogin(password, username);
    // assert
    verify(mockNetWorkInfo.isConnected);
  });
  test("should return remote data when the call to remote data source is successful",
    () async {
    // arrange
    when(mockNetWorkInfo.isConnected).thenAnswer((realInvocation) async=> true);
    // act
    final result = await repository.getConcreteLogin(username, password);
    // assert
    verify(mockLoginDataSource.fetchAnswerLogin());
  //  expect(result , equals(Right(tLogin)));
  });
}
