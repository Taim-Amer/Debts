import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taha_debts/bindings/general_bindings.dart';
import 'package:taha_debts/bindings/signin_binding.dart';
import 'package:taha_debts/features/authentication/screens/signin/signin_screen.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';
import 'package:taha_debts/utils/router/app_router.dart';
import 'package:taha_debts/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(THelperFunctions.screenWidth(context), THelperFunctions.screenHeight(context)),
      builder: (_, child) =>  GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.darkTheme,
          // initialRoute: AppRoutes.signin,
          getPages: AppRoutes.routes,
          initialBinding: SigninBinding(),
          home: const SigninScreen()
      ),
    );
  }
}