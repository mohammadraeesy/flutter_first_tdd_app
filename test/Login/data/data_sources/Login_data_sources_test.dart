import 'dart:convert';

import 'package:flutter_first_tdd_app/features/login/data/data_sources/Login_data_sources.dart';
import 'package:flutter_first_tdd_app/features/login/data/models/Login_model.dart';
import 'package:flutter_first_tdd_app/features/login/domain/entities/login_entities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../fixtures/fixture.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  LoginDataSourcesImpl dataSourc;
  MockHttpClient mockHttpClient;
  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSourc = LoginDataSourcesImpl(client: mockHttpClient);
  });
  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any))
        .thenAnswer((_) async => http.Response(fixture('testJson.json'), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any))
        .thenAnswer((_) async => http.Response('some thing is roung', 404));
  }

  group('getConcreteLogin', () {
    String userName = 'eve.holt@reqres.in';
    String passWold = 'pistol';
    final tLogin = Login(username: passWold, password: userName);
    final tLoginModel =
        LoginModel.fromJson(json.decode(fixture('Login_cashed.json')));
    test("should perform a GET request on a URL ",
      () async {
      // arrange
      setUpMockHttpClientSuccess200();
      // act
      dataSourc.fetchAnswerLogin();
      // assert
      verify(mockHttpClient.get('https://reqres.in/api/register'));
    });
    test("should return NumberTrivia when the response code is 200 (success) ",
      () async {
      // arrange
      setUpMockHttpClientSuccess200();
      // act
      final result = await dataSourc.fetchAnswerLogin();
      // assert
 //     expect(result, equals(tLoginModel));
    });

  });
}
