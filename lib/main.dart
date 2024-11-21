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
  TLoggerHelper.info('FCM Token: ${TCacheHelper.getData(key: "fcmToken")}');

  await requestNotificationPermission();

  await initializeLocalNotifications();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    TLoggerHelper.info("Foreground message received: ${message.notification?.title}");
    TLoggerHelper.info("Message body: ${message.notification?.body}");
    showNotification(message.notification?.title ?? '', message.notification?.body ?? '');
  });

  // Set up background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);

  Get.testMode = true;

  runApp(const App());
}

// Request notification permission on the device
Future<void> requestNotificationPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    TLoggerHelper.info('User granted notification permission');
  } else {
    TLoggerHelper.error('User declined notification permission');
  }
}

// Firebase background message handler
Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
  TLoggerHelper.error('Background message received: ${message.notification?.title}');
  showNotification(message.notification?.title ?? '', message.notification?.body ?? '');
}

// Initialize flutter_local_notifications plugin
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> initializeLocalNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

// Show the notification locally
void showNotification(String title, String body) {
  TLoggerHelper.error("===================================================");

  var android = const AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    importance: Importance.high,
    priority: Priority.high,
    showWhen: false, // Prevents notification from showing timestamp
  );
  var platform = NotificationDetails(android: android);

  flutterLocalNotificationsPlugin.show(
    0,
    title,
    body,
    platform,
  );
}
