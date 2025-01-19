import 'package:first_project/core/routing/routes_name.dart';
import 'package:first_project/core/services/dependency_injection.dart';
import 'package:first_project/features/auth/manager/auth_cubit.dart';
import 'package:first_project/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    PageTransition transition<T extends Cubit<Object>>({
      required Widget screen,
      T? cubit,
      Object? arguments,
      PageTransitionType type = PageTransitionType.fade,
      Duration duration = const Duration(milliseconds: 200),
      Alignment alignment = Alignment.center,
    })
    {
      final child = cubit != null
          ? BlocProvider<T>(
              create: (context) => cubit,
              child: screen,
            )
          : screen;

      return PageTransition(
        child: child,
        type: type,
        duration: duration,
        alignment: alignment,
        settings: settings,
      );
    }

    switch (settings.name) {
      case Routes.loginScreen:
        return transition(
          screen: const LoginScreen(),
          cubit: AuthCubit(getIt()),
        );

      default:
        return null;
    }
  }
}
