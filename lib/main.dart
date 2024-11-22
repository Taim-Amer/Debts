import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taha_debts/app.dart';
import 'package:taha_debts/firebase_options.dart';
import 'package:taha_debts/utils/helpers/helper_functions.dart';
import 'utils/storage/cache_helper.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await TCacheHelper.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    THelperFunctions.viewNotification(message);
  });

  // TLoggerHelper.info(TCacheHelper.getData(key: 'fcmToken'));
  
  Get.testMode = true;

  runApp(const App());
}
