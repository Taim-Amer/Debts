import 'package:taha_debts/features/notifications/models/notification_model.dart';

abstract class NotificationRepository{

  Future<void> sendNotification({required String title, required String body});

  Future<NotificationModel> getNotifications();
}