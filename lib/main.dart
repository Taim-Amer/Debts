import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taha_debts/app.dart';
import 'package:taha_debts/firebase_options.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:taha_debts/utils/logging/logger.dart';
import 'utils/storage/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TCacheHelper.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  String? fcmToken = await FirebaseMessaging.instance.getToken();
  TCacheHelper.saveData(key: "fcmToken", value: fcmToken);
  TLoggerHelper.info(TCacheHelper.getData(key: "fcmToken"));

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    TLoggerHelper.info("Foreground message received: ${message.notification?.title}");
    showNotification(message.notification?.title ?? '', message.notification?.body ?? '');
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);

  Get.testMode = true;

  runApp(const App());
}

Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
  print('Background message received: ${message.notification?.title}');
  showNotification(message.notification?.title ?? '', message.notification?.body ?? '');
}

void showNotification(String title, String body) {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  var android = const AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    importance: Importance.high,
    priority: Priority.high,
  );
  var platform = NotificationDetails(android: android);

  flutterLocalNotificationsPlugin.show(
    0,
    title,
    body,
    platform,
  );
}
