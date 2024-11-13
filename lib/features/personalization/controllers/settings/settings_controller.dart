import 'dart:ui';

import 'package:get/get.dart';

class SettingsController extends GetxController{
  static SettingsController get instance => Get.find();

  RxInt selectedLanguage = 1.obs;
  Rx<Locale> locale = const Locale("ar").obs;

  void setSelectedRadio(value){
    selectedLanguage.value = value;
    if(value == 1){
      print(value);
      locale.value = const Locale('ar');
      print(Get.locale);
      Get.updateLocale(locale.value);

    }else if(value == 2){
      print(value);
      locale.value =  const Locale('en');
      print(Get.locale);
      Get.updateLocale(locale.value);
    }
  }
}