import 'package:dio/dio.dart';
import 'package:first_project/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:first_project/features/auth/data/api_services/api_services.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {

  /// Auth
  /// Dio
  getIt.registerLazySingleton<DioHelper>(() => DioHelper());
  /// ApiServices
  getIt.registerLazySingleton<AuthApiServices>(() => AuthApiServices(getIt()));
  /// Repos
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(getIt()));
}