import 'package:easy_localization/easy_localization.dart';
import 'package:first_project/core/cache_helper/cache_helper.dart';
import 'package:first_project/core/cache_helper/cache_keys.dart';
import 'package:first_project/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:first_project/core/routing/app_router.dart';
import 'package:first_project/core/routing/routes_name.dart';
import 'package:first_project/core/services/dependency_injection.dart';
import 'package:first_project/core/utils/app_constants.dart';
import 'package:first_project/core/utils/bloc_observer.dart';
import 'package:first_project/core/utils/log_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();

  // await EasyLocalization.ensureInitialized();
  await DioHelper.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await CacheHelper.init();

  Bloc.observer = MyBlocObserver();
  AppConstants.userToken =
      await CacheHelper.getSecuredString(key: CacheKeys.userToken);
  logSuccess("User Token : ${AppConstants.userToken}");

  runApp(
    Phoenix(
      child: DarElSallamrefacorApp(
        appRouter: AppRouter(),
        token: AppConstants.userToken,
      ),
    ),
  );
}

class DarElSallamrefacorApp extends StatelessWidget {
  final AppRouter appRouter;
  final String? token;

  const DarElSallamrefacorApp({
    super.key,
    required this.appRouter,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        child: MaterialApp(
          title: 'djafh',
          debugShowCheckedModeBanner: false,
          navigatorKey: AppConstants.navigatorKey,
          // localizationsDelegates: context.localizationDelegates,
          // supportedLocales: context.supportedLocales,
          // locale: context.locale,
          themeMode: ThemeMode.light,
          initialRoute: Routes.loginScreen,
          onGenerateRoute: appRouter.generateRoute,
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}
