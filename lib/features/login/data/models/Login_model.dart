import 'package:flutter/cupertino.dart';
import 'package:flutter_first_tdd_app/features/login/domain/entities/login_entities.dart';

class LoginModel extends Login {
  LoginModel({@required String Password, @required String username})
      : super(username: Password, password: username);

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(Password: json['password'], username: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {'password': username, 'email': password};
  }
}
