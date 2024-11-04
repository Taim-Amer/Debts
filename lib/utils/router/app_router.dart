import 'package:get/get.dart';
import 'package:taha_debts/bindings/otp_binding.dart';
import 'package:taha_debts/bindings/signin_binding.dart';
import 'package:taha_debts/features/authentication/screens/otp/otp_screen.dart';
import 'package:taha_debts/features/authentication/screens/signin/signin_screen.dart';

class AppRoutes {
  static const signin = '/signin';
  static const otp = '/otp';

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
    )
  ];
}