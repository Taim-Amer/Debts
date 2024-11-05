import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/alerts/toast.dart';
import 'package:taha_debts/features/authentication/repositories/signup/signup_repo_impl.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  var apiStatus = RequestState.begin.obs;

  void updateStatus({required RequestState value}) {
    apiStatus.value = value;
  }

  Future<void> signup() async{
    final phone = TCacheHelper.getData(key: "phone");
    try{
      await SignupRepositoryImpl.instance.signup(usernameController.text.trim(), phone, emailController.text.trim(), "fcmToken");
      updateStatus(value: RequestState.success);
      showToast("تم ارسال رمز التوثيق بنجاح", ToastState.success);
    }catch (error){
      updateStatus(value: RequestState.onError);
      showToast("حدث خطأ ما يرجى التاكد ثم اعادة المحاولة", ToastState.error);
    }
  }
}