import 'package:bloc/bloc.dart';
import 'package:first_project/core/helper_functions/flutter_toast.dart';
import 'package:first_project/core/utils/easy_loading.dart';
import 'package:first_project/core/utils/log_util.dart';
import 'package:first_project/features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthInitial());

  final AuthRepository authRepository;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// Login
  Future userLogin({String? email, String? password}) async {
    showLoading();
    emit(LoginLoading());
    final result = await authRepository.userLogin(
        email: email ?? emailController.text,
        password: passwordController.text,
        );
    result.when(success: (success) {
      hideLoading();
      customToast(msg: success, color: Colors.green);
      emit(LoginSuccess());
    }, failure: (error) {
      hideLoading();
      customToast(msg: error.errMessage, color: Colors.red);
      emit(LoginError());
    });
  }
}
