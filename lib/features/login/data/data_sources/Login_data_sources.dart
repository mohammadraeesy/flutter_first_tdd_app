import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_first_tdd_app/cor/erorr/NotValidInput.dart';
import 'package:flutter_first_tdd_app/cor/erorr/exceptions.dart';
import 'package:flutter_first_tdd_app/features/login/data/models/Login_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginDataSources {
  Future<LoginModel> fetchAnswerLogin();
}

class LoginDataSourcesImpl implements LoginDataSources {
  final http.Client client;

  LoginDataSourcesImpl({@required this.client});

  @override
  Future<LoginModel> fetchAnswerLogin() =>
      _getLoginFromUrl('https://reqres.in/api/register');

  Future<LoginModel> _getLoginFromUrl(String url) async {
    final response = await client.get(url);
    final responseFull = json.decode(response.body);
    if (response.statusCode == 200) {
      if (responseFull['id']==4)
        return LoginModel.fromJson(responseFull);
      else throw NotValidInput();
    } else {
      throw SeverException();
    }
  }
}
