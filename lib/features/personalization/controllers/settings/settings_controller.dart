import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/alerts/toast.dart';
import 'package:taha_debts/features/personalization/repositories/profile/profile_repo_impl.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/router/app_router.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class SettingsController extends GetxController{
  static SettingsController get instance => Get.find();

  RxInt selectedLanguage = 2.obs;
  // RxInt? selectedLanguage;
  Rx<Locale> locale = const Locale("en").obs;
  var logoutApiStatus = RequestState.begin.obs;
  var themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    String? savedTheme = TCacheHelper.getData(key: "themeMode");
    if (savedTheme == "light") {
      themeMode.value = ThemeMode.light;
    } else if (savedTheme == "dark") {
      themeMode.value = ThemeMode.dark;
    } else {
      themeMode.value = ThemeMode.system;
    }
  }

  void updateThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    String themeString = mode == ThemeMode.light ? "light" : mode == ThemeMode.dark ? "dark" : "system";
    TCacheHelper.saveData(key: "themeMode", value: themeString);
  }

  void updateLogoutStatus({required RequestState value}) {
    logoutApiStatus.value = value;
  }

  void setSelectedRadio(value){
    selectedLanguage?.value = value;
    if(value == 1){
      locale.value = const Locale('ar');
      TCacheHelper.saveData(key: "locale", value: "ar");
      Get.updateLocale(locale.value);

    }else if(value == 2){
      locale.value =  const Locale('en');
      TCacheHelper.saveData(key: "locale", value: "en");
      Get.updateLocale(locale.value);
    }
  }

  Future<void> logout() async{
    updateLogoutStatus(value: RequestState.loading);

    try {
      await ProfileRepositoryImpl.instance.logout();
      TCacheHelper.removeData(key: "token");
      Get.offAllNamed(AppRoutes.signin);
      updateLogoutStatus(value: RequestState.success);
    }catch(error){
      updateLogoutStatus(value: RequestState.onError);
      showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.success);
    }
  }
}