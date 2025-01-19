import 'package:dio/dio.dart';
import 'package:first_project/core/cache_helper/cache_helper.dart';
import 'package:first_project/core/cache_helper/cache_keys.dart';
import 'package:first_project/core/networks_helper/api_results/api_result.dart';
import 'package:first_project/core/networks_helper/errors/exceptions.dart';
import 'package:first_project/core/networks_helper/errors/failure.dart';
import 'package:first_project/core/utils/app_constants.dart';
import 'package:first_project/core/utils/log_util.dart';
import 'package:first_project/features/auth/data/api_services/api_services.dart';
import 'package:first_project/features/auth/data/models/user_data_model.dart';

class AuthRepository {
  final AuthApiServices authApiServices;

  AuthRepository(this.authApiServices);

  /// Login
  Future<ApiResult<String>> userLogin({
    required String email,
    required String password,
  }) async {
    final response = await authApiServices.login(
      email: email,
      password: password,
    );
    try {
      if (response!.statusCode == 200 || response.statusCode == 201) {
        UserDataModel model = UserDataModel.fromJson(response.data);
        await CacheHelper.saveSecuredString(
            key: CacheKeys.userToken, value: model.authorization!.token);
        await CacheHelper.saveData(
            key: CacheKeys.userName, value: model.userData!.userName);
        AppConstants.userToken = await CacheHelper.getSecuredString(key: CacheKeys.userToken);
        return ApiResult.success(model.message!);
      } else {
        return ApiResult.failure(FailureException(errMessage: 'Server error'));
      }
    } on DioException catch (e) {
      try {
        handleDioException(e);
      } on ServerException catch (ex) {
        return ApiResult.failure(ex.errorModel.errorMessage);
      }
    }

    return ApiResult.failure(FailureException(errMessage: 'Unexpected error occurred'));
  }
}
