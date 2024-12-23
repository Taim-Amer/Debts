import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/alerts/toast.dart';
import 'package:taha_debts/features/authentication/repositories/signup/signup_repo_impl.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/router/app_router.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  var signupApiStatus = RequestState.begin.obs;

  void updateStatus({required RequestState value}) {
    signupApiStatus.value = value;
  }

  Future<void> signup() async{
    updateStatus(value: RequestState.loading);
    if (!signupFormKey.currentState!.validate()) {
      updateStatus(value: RequestState.begin);
      return;
    }

    final phone = TCacheHelper.getData(key: "phone");
    try{

      // String? fcmToken = (await FirebaseMessaging.instance.getToken())?.trim();
      // if (fcmToken == null) {
      //   showToast(TranslationKey.kErrorMessage, ToastState.error);
      //   TLoggerHelper.info("message");
      //   updateStatus(value: RequestState.onError);
      // }

      final response = await SignupRepositoryImpl.instance.signup(usernameController.text.trim(), phone, emailController.text.trim());
      updateStatus(value: RequestState.success);
      TCacheHelper.saveData(key: "token", value: response.token);
      Get.offAllNamed(AppRoutes.home);
      showToast(TranslationKey.kNewAccountMessage, ToastState.success);
    }catch (error){
      updateStatus(value: RequestState.onError);
      showToast(TranslationKey.kErrorMessage, ToastState.error);
    }
  }
}