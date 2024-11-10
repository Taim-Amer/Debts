import 'package:get/get.dart';
import 'package:taha_debts/features/debts/controllers/home_controller/home_controller.dart';
import 'package:taha_debts/features/debts/repositories/home/home_repo_impl.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {

    // من احل اسم المستخدم يلي بالهوم
    // Get.put(ProfileController());
    // Get.put(ProfileRepositoryImpl());
    
    Get.put(HomeController());
    Get.put(HomeRepositoryImpl());
  }
}