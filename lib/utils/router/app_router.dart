import 'package:get/get.dart';
import 'package:taha_debts/bindings/signin_binding.dart';
import 'package:taha_debts/features/authentication/screens/signin/signin_screen.dart';

class AppRoutes {
  static const signin = '/signin';

  static List<GetPage> routes = [
    GetPage(
      name: signin,
      page: () => const SigninScreen(),
      binding: SigninBinding(),
      transition: Transition.rightToLeft
    )
  ];
}