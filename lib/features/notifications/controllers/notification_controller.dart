import 'package:get/get.dart';
import 'package:taha_debts/features/notifications/models/notification_model.dart';
import 'package:taha_debts/features/notifications/repositories/repo_impl.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/logging/logger.dart';

class NotificationController extends GetxController{
  static NotificationController get instance => Get.find();

  var getNotificationStatus = RequestState.begin.obs;
  var notificationsModel = NotificationModel().obs;

  @override
  void onReady() {
    getNotifications();
    super.onReady();
  }

  void updateGetNotificationStatus({required RequestState value}){
    getNotificationStatus.value = value;
  }

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

  Future<void> getNotifications() async{
    updateGetNotificationStatus(value: RequestState.loading);

    try{
      notificationsModel.value = await NotificationRepositoryImpl.instance.getNotifications();
      updateGetNotificationStatus(value: RequestState.success);
    } catch(error){
      updateGetNotificationStatus(value: RequestState.onError);
    }
  }
}