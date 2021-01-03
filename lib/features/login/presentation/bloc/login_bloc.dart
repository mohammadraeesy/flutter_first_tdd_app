import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_first_tdd_app/cor/erorr/failures.dart';
import 'package:flutter_first_tdd_app/cor/util/input_converter.dart';
import 'package:flutter_first_tdd_app/features/login/domain/entities/login_entities.dart';
import 'package:flutter_first_tdd_app/features/login/domain/usecase/get_concrete_login_usecase.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE_USERNAME =
    'Invalid Input - The username not valid.';
const String INVALID_INPUT_FAILURE_MESSAGE_PASSWORD =
    'Invalid Input - The password not valid.';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetConcreteLogin getConcreteLogin;
  final InputConverterUsername inputConverterUsername;
  final InputConverterPassword inputConverterPassword;
  LoginBloc(
      {@required concrete,
      @required this.inputConverterPassword,
      @required this.inputConverterUsername})
      : assert(concrete != null),
        getConcreteLogin = concrete,
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginBtnPreesEvent) {
      String tempString;
      final InputEtherPassword =
          inputConverterUsername.stringToUnsignedStringer(event.username);
      final InputEtherUsername =
          inputConverterPassword.stringToUnsignedStringer(event.password);
      yield* InputEtherUsername.fold((Failure) async* {
        yield ErrorState(massage: INVALID_INPUT_FAILURE_MESSAGE_USERNAME);
      }, (string) async* {
        yield LoginLoadingState();
        tempString = string;
      });
      yield* InputEtherPassword.fold((Failure) async* {
        yield ErrorState(massage: INVALID_INPUT_FAILURE_MESSAGE_PASSWORD);
      }, (string) async* {
        yield LoginLoadingState();
        final failureOrLogin = await getConcreteLogin(
            Params(username: tempString, passworld: string));
        yield* _eitherLoadedOrErrorState(failureOrLogin);
      });
    }
  }

  Stream<LoginState> _eitherLoadedOrErrorState(
    Either<Failure, Login> failureOrTrivia,
  ) async* {
    yield failureOrTrivia.fold(
      (failure) => ErrorState(massage: _mapFailureToMessage(failure)),
      (Login) => LoginLoadedState(login: Login),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
