import 'package:get/get.dart';
import 'package:taha_debts/bindings/home_binding.dart';
import 'package:taha_debts/bindings/signin_binding.dart';
import 'package:taha_debts/features/notifications/controllers/notification_controller.dart';
import 'package:taha_debts/features/notifications/repositories/repo_impl.dart';
import 'package:taha_debts/utils/router/app_router.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    String? token = TCacheHelper.getData(key: "token");

    if (token != null) {
      Get.offAllNamed(AppRoutes.home);
      Get.put<HomeBinding>(HomeBinding());
    } else {
      Get.offAllNamed(AppRoutes.signin);
      Get.put<SigninBinding>(SigninBinding());
    }

    Get.put<NotificationRepositoryImpl>(NotificationRepositoryImpl());
    Get.put<NotificationController>(NotificationController());
  }
}