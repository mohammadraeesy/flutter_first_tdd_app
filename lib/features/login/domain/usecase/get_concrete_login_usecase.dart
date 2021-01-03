import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_first_tdd_app/cor/erorr/failures.dart';
import 'package:flutter_first_tdd_app/cor/usecases/usecase.dart';
import 'package:flutter_first_tdd_app/features/login/domain/entities/login_entities.dart';
import 'package:flutter_first_tdd_app/features/login/domain/repositories/LoginRepository.dart';

class GetConcreteLogin implements UseCase<Login, Params> {
  final LoginRepository repository;
  GetConcreteLogin({@required this.repository});
  @override
  Future<Either<Failure, Login>> call(Params params) async {
    // TODO: implement call
    return await repository.getConcreteLogin(params.username, params.passworld);
  }
}

class Params extends Equatable {
  final String username;
  final String passworld;
  Params({@required this.username, @required this.passworld});
  @override
  // TODO: implement props
  List<Object> get props => [];
}
