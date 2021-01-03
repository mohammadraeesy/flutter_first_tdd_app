import 'package:flutter_first_tdd_app/cor/util/input_converter.dart';
import 'package:flutter_first_tdd_app/features/login/domain/usecase/get_concrete_login_usecase.dart';
import 'package:get_it/get_it.dart';

import 'cor/networl/network_Info.dart';
import 'features/login/data/data_sources/Login_data_sources.dart';
import 'features/login/data/repositories/Login_repositorie.dart';
import 'features/login/domain/repositories/LoginRepository.dart';
import 'features/login/presentation/bloc/login_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! Features - Login
  // Bloc
  sl.registerFactory(
    () => LoginBloc(
      concrete: sl(),
      inputConverterPassword: sl(),
      inputConverterUsername: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetConcreteLogin(repository: sl()));

  // Repository
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoriesImpl(
      loginDataSources: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<LoginDataSourcesImpl>(
    () => LoginDataSourcesImpl(client: sl()),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverterPassword());
  sl.registerLazySingleton(() => InputConverterUsername());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}
