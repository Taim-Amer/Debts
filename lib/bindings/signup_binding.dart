import 'package:get/get.dart';
import 'package:taha_debts/features/authentication/controllers/signup/signup_controller.dart';
import 'package:taha_debts/features/authentication/repositories/signup/signup_repo_impl.dart';

class SignupBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SignupController());
    Get.put(SignupRepositoryImpl());
  }
}