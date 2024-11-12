import 'package:get/get.dart';
import 'package:taha_debts/bindings/additions_binding.dart';
import 'package:taha_debts/bindings/client_profile_binding.dart';
import 'package:taha_debts/bindings/debt_schedule_binding.dart';
import 'package:taha_debts/bindings/home_binding.dart';
import 'package:taha_debts/bindings/notations_binding.dart';
import 'package:taha_debts/bindings/otp_binding.dart';
import 'package:taha_debts/bindings/profile_binding.dart';
import 'package:taha_debts/bindings/signin_binding.dart';
import 'package:taha_debts/bindings/signup_binding.dart';
import 'package:taha_debts/features/authentication/screens/otp/otp_screen.dart';
import 'package:taha_debts/features/authentication/screens/signin/signin_screen.dart';
import 'package:taha_debts/features/authentication/screens/signup/signup_screen.dart';
import 'package:taha_debts/features/debts/screens/additions/debt_addition_screen.dart';
import 'package:taha_debts/features/debts/screens/additions/pay_addition_screen.dart';
import 'package:taha_debts/features/debts/screens/client_profile/client_profile_screen.dart';
import 'package:taha_debts/features/debts/screens/debt_schedule/debt_schedule_screen.dart';
import 'package:taha_debts/features/debts/screens/home/home_screen.dart';
import 'package:taha_debts/features/notations/screens/notations_screen.dart';
import 'package:taha_debts/features/personalization/screens/profile/profile_screen.dart';
import 'package:taha_debts/features/personalization/screens/profile_edit/profile_edit_screen.dart';

class AppRoutes {
  static const signin = '/signin';
  static const otp = '/otp';
  static const signup = '/signup';
  static const home = '/home';
  static const profile = '/profile';
  static const profileEdit = '/profileEdit';
  static const debtSchedule = '/debtSchedule';
  static const addPayment = '/addPayment';
  static const addDebt = '/addDebt';
  static const clientProfile = '/clientProfile';
  static const notations = '/notations';

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
      page: () => const HomeScreen(),
      binding: HomeBinding(),
      transition: Transition.rightToLeft
    ),

    GetPage(
      name: profile,
      page: () => const ProfileScreen(),
      transition: Transition.rightToLeft,
      binding: ProfileBinding(),
    ),

    GetPage(
      name: profileEdit,
      page: () => const ProfileEditScreen(),
      binding: ProfileBinding(),
      transition: Transition.rightToLeft
    ),

    GetPage(
      name: debtSchedule,
      page: () => const DebtScheduleScreen(),
      binding: DebtScheduleBinding(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: addPayment,
      page: () => const PayAdditionScreen(),
      binding: AdditionBinding(),
      transition: Transition.rightToLeft
    ),

    GetPage(
        name: addDebt,
        page: () => const DebtAdditionScreen(),
        binding: AdditionBinding(),
        transition: Transition.rightToLeft
    ),

    GetPage(
        name: clientProfile,
        page: () => const ClientProfileScreen(),
        binding: ClientProfileBinding(),
        transition: Transition.rightToLeft
    ),

    GetPage(
        name: notations,
        page: () => const NotationsScreen(),
        binding: NotationsBinding(),
        transition: Transition.rightToLeft
    ),
  ];
}