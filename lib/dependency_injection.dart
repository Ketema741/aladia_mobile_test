import 'package:aladia_flutter_test/core/network/network_info.dart';
import 'package:aladia_flutter_test/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:aladia_flutter_test/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:aladia_flutter_test/features/authentication/domain/repositories/auth_repository.dart';
import 'package:aladia_flutter_test/features/authentication/domain/usecases/usecases.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/login_bloc.dart';
import 'package:aladia_flutter_test/features/authentication/presentation/bloc/register_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';


final sl = GetIt.instance;

void init() async {
  // Registering the UseCase as a lazy singleton
  sl.registerLazySingleton(() => SigninUserUsecase(sl()));
  sl.registerLazySingleton(() => SignupUserUsecase(sl()));


  // Registering the Repository as a lazy singleton
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

 

  // // Registering the LocalDataSourceImpl as a lazy singleton
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(client: sl()));

  // Registering the Bloc as a factory
  sl.registerFactory(() => LoginBloc(loginUseCase: sl()));
  sl.registerFactory(() => RegisterBloc(registerUseCase: sl()));

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
        InternetConnectionChecker(),
      ));
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // Registering the http client as a lazy singleton
  // sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<http.Client>(() => http.Client());
}
