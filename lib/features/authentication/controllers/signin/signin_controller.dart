import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/alerts/toast.dart';
import 'package:taha_debts/features/authentication/repositories/signin/signin_repo_impl.dart';
import 'package:taha_debts/features/authentication/screens/otp/otp_screen.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/formatters/formatter.dart';
import 'package:taha_debts/utils/storage/local_storage.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  RxString countryCode = "+962".obs;
  final phoneController = TextEditingController();
  final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

  var apiStatus = RequestState.begin.obs;

  void updateStatus({required RequestState value}) {
    apiStatus.value = value;
  }

  Future<void> signin() async {
    updateStatus(value: RequestState.loading);

    // final isConnected = await NetworkManager.instance.isConnected();
    // if (!isConnected) {
    //   updateStatus(value: RequestState.onError);
    //   showToast("No internet connection", ToastState.error);
    //   return;
    // }

    // if (!signinFormKey.currentState!.validate()) {
    //   updateStatus(value: RequestState.begin);
    //   return;
    // }

    try {
      final response = await SigninRepositoryImpl.instance.signin(phoneController.text.trim());
      updateStatus(value: RequestState.success);
      showToast("تم ارسال رمز التوثيق بنجاح", ToastState.success);
      Get.to(const OtpScreen(), transition: Transition.rightToLeft);
    } catch (error) {
      updateStatus(value: RequestState.onError);
      showToast(error.toString(), ToastState.error);
    }
  }
}
