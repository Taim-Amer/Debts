import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/bindings/home_binding.dart';
import 'package:taha_debts/bindings/signin_binding.dart';
import 'package:taha_debts/features/personalization/controllers/settings/settings_controller.dart';
import 'package:taha_debts/localization/translations.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';
import 'package:taha_debts/utils/router/app_router.dart';
import 'package:taha_debts/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = Get.put(SettingsController());
    return ScreenUtilInit(
      designSize: Size(THelperFunctions.screenWidth(context), THelperFunctions.screenHeight(context)),
      builder: (_, child) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        initialRoute: AppRoutes.home,
        getPages: AppRoutes.routes,
        translations: TAppTranslations(),
        locale: settingsController.locale.value,
        // locale: const Locale("en"),
        initialBinding: HomeBinding(),
        // home: const DebtAdditionScreen()
      ),
    );
  }
}