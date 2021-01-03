import 'package:dartz/dartz.dart';
import 'package:flutter_first_tdd_app/cor/erorr/failures.dart';
import 'package:flutter_first_tdd_app/features/login/domain/entities/login_entities.dart';

abstract class LoginRepository {
  Future<Either<Failure , Login>> getConcreteLogin(String username , String passworld);
}