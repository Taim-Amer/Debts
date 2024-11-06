import 'package:get/get.dart';
import 'package:taha_debts/bindings/otp_binding.dart';
import 'package:taha_debts/bindings/profile_binding.dart';
import 'package:taha_debts/bindings/signin_binding.dart';
import 'package:taha_debts/bindings/signup_binding.dart';
import 'package:taha_debts/features/authentication/screens/otp/otp_screen.dart';
import 'package:taha_debts/features/authentication/screens/signin/signin_screen.dart';
import 'package:taha_debts/features/authentication/screens/signup/signup_screen.dart';
import 'package:taha_debts/features/debts/screens/home/home_empty_screen.dart';
import 'package:taha_debts/features/personalization/models/profile/user_profile_model.dart';
import 'package:taha_debts/features/personalization/screens/profile/profile_screen.dart';

class AppRoutes {
  static const signin = '/signin';
  static const otp = '/otp';
  static const signup = '/signup';
  static const home = '/home';
  static const profile = '/profile';

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
    ),

    GetPage(
      name: home,
      page: () => const HomeEmptyScreen(),
      transition: Transition.rightToLeft
    ),

    GetPage(
      name: profile,
      page: () => const ProfileScreen(),
      transition: Transition.rightToLeft,
      binding: ProfileBinding(),
      // arguments: UserProfileModel()
    )
  ];
}