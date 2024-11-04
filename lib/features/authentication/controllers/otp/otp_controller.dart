import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/alerts/toast.dart';
import 'package:taha_debts/features/authentication/repositories/otp/otp_repo_impl.dart';
import 'package:taha_debts/features/authentication/screens/signup/signup_screen.dart';
import 'package:taha_debts/utils/constants/enums.dart';
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
    int code = int.tryParse(codeController.text.trim())!;
    try{
      final response = await OtpRepositoryImpl.instance.verify(phone, code);
      updateStatus(value: RequestState.success);
      Get.to(const SignupScreen(), transition: Transition.rightToLeft);
    }catch(error){
      updateStatus(value: RequestState.onError);
      showToast(error.toString(), ToastState.error);
    }
  }

}

