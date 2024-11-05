import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/alerts/toast.dart';
import 'package:taha_debts/features/authentication/repositories/otp/otp_repo_impl.dart';
import 'package:taha_debts/features/authentication/screens/signup/signup_screen.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/router/app_router.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class OtpController extends GetxController{
  static OtpController get instance => Get.find();

  final codeController = TextEditingController();

  var apiStatus = RequestState.begin.obs;
  var phone = TCacheHelper.getData(key: "phone");

  void updateStatus({required RequestState value}) {
    apiStatus.value = value;
  }

  Future<void> verify() async{
    updateStatus(value: RequestState.loading);
    if(apiStatus.value == RequestState.loading){
      const CircularProgressIndicator();
    }
    try{
      final response = await OtpRepositoryImpl.instance.verify(phone, codeController.text);
      updateStatus(value: RequestState.success);
      TCacheHelper.saveData(key: "token", value: response.token);
      Get.toNamed(AppRoutes.signup);
    }catch(error){
      updateStatus(value: RequestState.onError);
      showToast(error.toString(), ToastState.error);
    }
  }

}
