import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/alerts/toast.dart';
import 'package:taha_debts/features/authentication/repositories/signin/signin_repo_impl.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/constants/text_strings.dart';
import 'package:taha_debts/utils/router/app_router.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  RxString countryCode = "+963".obs;
  final phoneController = TextEditingController();
  final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

  var signinApiStatus = RequestState.begin.obs;

  void updateStatus({required RequestState value}) {
    signinApiStatus.value = value;
  }

  Future<void> signin() async {
    updateStatus(value: RequestState.loading);

    if (!signinFormKey.currentState!.validate()) {
      updateStatus(value: RequestState.begin);
      return;
    }

    try {
      final response = await SigninRepositoryImpl.instance.signin(phoneController.text.trim());
      updateStatus(value: RequestState.success);

      showToast(TranslationKey.kVerificationCodeMessage, ToastState.success);
      Get.toNamed(AppRoutes.otp); 
      TCacheHelper.saveData(key: "isNewAccount", value: response.isNewAccount);
      TCacheHelper.saveData(key: "phone", value: phoneController.text.trim());
    } catch (error) {
      updateStatus(value: RequestState.onError);
      showToast(TArabicTexts.errorMessage, ToastState.error);
    }
  }
}
