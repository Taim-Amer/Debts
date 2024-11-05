import 'package:get/get.dart';
import 'package:taha_debts/bindings/otp_binding.dart';
import 'package:taha_debts/bindings/signin_binding.dart';
import 'package:taha_debts/bindings/signup_binding.dart';
import 'package:taha_debts/features/authentication/screens/otp/otp_screen.dart';
import 'package:taha_debts/features/authentication/screens/signin/signin_screen.dart';
import 'package:taha_debts/features/authentication/screens/signup/signup_screen.dart';

class AppRoutes {
  static const signin = '/signin';
  static const otp = '/otp';
  static const signup = '/signup';

  static List<GetPage> routes = [
    GetPage(
      name: signin,
      page: () => const SigninScreen(),
      binding: SigninBinding(),
      transition: Transition.rightToLeft
    ),

    GetPage(
      name: otp,
      page: () => const OtpScreen(),
      binding: OtpBinding(),
      transition: Transition.rightToLeft
    ),

    GetPage(
      name: signup,
      page: () => SignupScreen(),
      binding: SignupBinding(),
      transition: Transition.rightToLeft,
    )
  ];
}