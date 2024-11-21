import 'package:get/get.dart';
import 'package:taha_debts/features/notifications/repositories/repo_impl.dart';
import 'package:taha_debts/utils/logging/logger.dart';

class NotificationController extends GetxController{
  static NotificationController get instance => Get.find();

  Future<void> sendNotification() async{
    try{
      await NotificationRepositoryImpl.instance.sendNotification(
        title: "test message title",
        body: 'test message body',
      );
    } catch(error){
      TLoggerHelper.error(error.toString());
    }
  }
}