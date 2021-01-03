import 'package:dartz/dartz.dart';
import 'package:flutter_first_tdd_app/cor/erorr/failures.dart';

class InputConverterUsername {
  Either<Failure , String> stringToUnsignedStringer (String username){
    try{
      if (username.length<3)
        throw FormatException();
      return Right(username);
    }on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}
class InvalidInputFailure extends Failure {}
class InputConverterPassword {
  Either<Failure , String> stringToUnsignedStringer (String password){
    try{
      if (password.length<3)
        throw FormatException();
      return Right(password);
    }on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}