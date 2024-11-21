import 'package:get/get.dart';
import 'package:taha_debts/features/notifications/controllers/notification_controller.dart';
import 'package:taha_debts/features/notifications/repositories/repo_impl.dart';

class NotificationBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<NotificationController>(NotificationController());
    Get.put<NotificationRepositoryImpl>(NotificationRepositoryImpl());
  }
}