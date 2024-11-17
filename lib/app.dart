import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/bindings/general_bindings.dart';
import 'package:taha_debts/features/personalization/controllers/settings/settings_controller.dart';
import 'package:taha_debts/localization/translations.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';
import 'package:taha_debts/utils/router/app_router.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';
import 'package:taha_debts/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<SettingsController>(SettingsController());
    String? token = TCacheHelper.getData(key: "token");
    String initialRoute = token != null ? AppRoutes.home : AppRoutes.signin;
    String? language = TCacheHelper.getData(key: "locale");

    return ScreenUtilInit(
      designSize: Size(THelperFunctions.screenWidth(context), THelperFunctions.screenHeight(context)),
      builder: (_, child) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        initialRoute: initialRoute,
        getPages: AppRoutes.routes,
        translations: TAppTranslations(),
        locale: Locale(language ?? 'en'),
        fallbackLocale: const Locale('en'),
        initialBinding: GeneralBindings(),
      ),
    );
  }
}