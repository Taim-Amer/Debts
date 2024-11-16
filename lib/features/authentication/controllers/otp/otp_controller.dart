import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/alerts/toast.dart';
import 'package:taha_debts/features/authentication/repositories/otp/otp_repo_impl.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/router/app_router.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class OtpController extends GetxController{
  static OtpController get instance => Get.find();

  final codeController = TextEditingController();

  var otpApiStatus = RequestState.begin.obs;
  var phone = TCacheHelper.getData(key: "phone");

  void updateStatus({required RequestState value}) {
    otpApiStatus.value = value;
  }

  Future<void> verify() async{
    updateStatus(value: RequestState.loading);
    try{
      final response = await OtpRepositoryImpl.instance.verify(phone, codeController.text);
      updateStatus(value: RequestState.success);
      if(TCacheHelper.getData(key: "isNewAccount") == true){
        Get.toNamed(AppRoutes.signup);
      } else if(TCacheHelper.getData(key: "isNewAccount") == false){
        TCacheHelper.saveData(key: "token", value: response.token);
        TCacheHelper.saveData(key: "firstPage", value: "home");
        Get.offAllNamed(AppRoutes.home);
      }
    }catch(error){
      updateStatus(value: RequestState.onError);
      showToast(TArabicTexts.errorMessage, ToastState.error);
    }
  }

  Future<void> resendOtp() async{
    await OtpRepositoryImpl.instance.resendCode(phone);
  }
}

