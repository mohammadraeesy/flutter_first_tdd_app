import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_first_tdd_app/cor/erorr/failures.dart';
import 'package:flutter_first_tdd_app/cor/networl/network_Info.dart';
import 'package:flutter_first_tdd_app/features/login/data/data_sources/Login_data_sources.dart';
import 'package:flutter_first_tdd_app/features/login/domain/entities/login_entities.dart';
import 'package:flutter_first_tdd_app/features/login/domain/repositories/LoginRepository.dart';

class LoginRepositoriesImpl implements LoginRepository {
  final LoginDataSources loginDataSources;
  final NetworkInfo networkInfo;
  LoginRepositoriesImpl(
      {@required this.loginDataSources, @required this.networkInfo});

  @override
  Future<Either<Failure, Login>> getConcreteLogin(
      String username, String passworld) async {
    // TODO: implement getConcreteLogin
    return await _getLogin();
  }

  Future<Either<Failure, Login>> _getLogin() async {
    if (await networkInfo.isConnected) {
      loginDataSources.fetchAnswerLogin();
    } else {
      throw Exception();
    }
  }
}
