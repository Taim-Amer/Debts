import 'package:get/get.dart';
import 'package:taha_debts/features/personalization/controllers/profile/profile_controller.dart';
import 'package:taha_debts/features/personalization/repositories/profile/profile_repo_impl.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {

    // من احل اسم المستخدم يلي بالهوم
    // Get.put(ProfileController());
    // Get.put(ProfileRepositoryImpl());
  }
}