import 'package:dartz/dartz.dart';
import 'package:flutter_first_tdd_app/features/login/domain/entities/login_entities.dart';
import 'package:flutter_first_tdd_app/features/login/domain/repositories/LoginRepository.dart';
import 'package:flutter_first_tdd_app/features/login/domain/usecase/get_concrete_login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLoginRepository extends Mock implements LoginRepository{}
void main(){
  GetConcreteLogin usecase;
  MockLoginRepository mockLoginRepository;
  setUp((){
    mockLoginRepository = MockLoginRepository();
    usecase = GetConcreteLogin(repository: mockLoginRepository);
  });
  String userName = 'eve.holt@reqres.in';
  String passWold = 'pistol';
  final tLogin = Login(username: passWold, password: userName);
  test("should get the login deateal frome the repository ",
    () async {
    // arrange
    when(mockLoginRepository.getConcreteLogin(any, any)).thenAnswer((_) async=>Right(tLogin));
    // act
    final result = await usecase(Params(username: userName,passworld: passWold));
    // assert
    expect(result, Right(tLogin));
    verify(mockLoginRepository.getConcreteLogin(userName, passWold));
    verifyNoMoreInteractions(mockLoginRepository);

  });
}