import 'package:get/get.dart';
import 'package:taha_debts/features/authentication/controllers/signin/signin_controller.dart';
import 'package:taha_debts/features/authentication/repositories/signin/signin_repo_impl.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    // Get.put(NetworkManager());

    // ---Signin binding
    Get.put(SignInController());
    Get.put(SigninRepositoryImpl());

    // ---Verify binding
  }
}

// TCacheHelper.saveData(key: "firstPage", value: "home");