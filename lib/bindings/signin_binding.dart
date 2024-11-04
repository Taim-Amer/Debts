import 'package:get/get.dart';
import 'package:taha_debts/features/authentication/controllers/signin/signin_controller.dart';
import 'package:taha_debts/features/authentication/repositories/signin/signin_repo.dart';
import 'package:taha_debts/features/authentication/repositories/signin/signin_repo_impl.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SigninRepository>(SigninRepositoryImpl());
    Get.put<SignInController>(SignInController());
  }
}

