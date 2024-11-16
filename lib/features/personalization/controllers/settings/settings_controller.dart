import 'dart:ui';

import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/alerts/toast.dart';
import 'package:taha_debts/features/personalization/repositories/profile/profile_repo_impl.dart';
import 'package:taha_debts/utils/constants/enums.dart';

class SettingsController extends GetxController{
  static SettingsController get instance => Get.find();

  RxInt selectedLanguage = 1.obs;
  Rx<Locale> locale = const Locale("ar").obs;
  var logoutApiStatus = RequestState.begin.obs;

  void updateLogoutStatus({required RequestState value}) {
    logoutApiStatus.value = value;
  }

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

  Future<void> logout() async{
    updateLogoutStatus(value: RequestState.loading);

    try {
      await ProfileRepositoryImpl.instance.logout();
      showToast("========================================", ToastState.success);
      ///============================= navigate to first screen
      updateLogoutStatus(value: RequestState.success);
    }catch(error){
      updateLogoutStatus(value: RequestState.onError);
      showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.success);
    }
  }
}