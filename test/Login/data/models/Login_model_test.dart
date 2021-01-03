import 'dart:convert';

import 'package:flutter_first_tdd_app/features/login/data/models/Login_model.dart';
import 'package:flutter_first_tdd_app/features/login/domain/entities/login_entities.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture.dart';

void main(){
  String password = 'password';
  String userName = 'email';
  final tLoginModel =LoginModel(Password: "pistol", username: "eve.holt@reqres.in");
  test("should a sub class of Login",
    () async {
    // assert
    expect(tLoginModel, isA<Login>());
  });
  test("should return username & passWorld",
    () async {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(fixture('Login_cashed.json'));
    // if (jsonMap['password']=='pistol'&&jsonMap['email']=="eve.holt@reqres.in")
    //   print('yes');
    // act
    final result = LoginModel.fromJson(jsonMap);
    // print(result.userName);
    // print(tLoginModel.userName);
    // print(result.Password);
    //
    // print(tLoginModel.Password);
    // // assert
    // expect(result, tLoginModel);
  });
}