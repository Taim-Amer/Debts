import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:taha_debts/features/authentication/models/signup/signup_model.dart';
import 'package:taha_debts/features/authentication/repositories/signup/signup_repo.dart';
import 'package:taha_debts/utils/api/dio_helper.dart';
import 'package:taha_debts/utils/constants/api_constants.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class SignupRepositoryImpl implements SignupRepository{
  static SignupRepositoryImpl get instance => Get.find();

  @override
  Future<SignupModel> signup(String name, String phone, String email) async {
    TDioHelper dioHelper = TDioHelper();

    String? fcmToken = (await FirebaseMessaging.instance.getToken())?.trim();
    TCacheHelper.saveData(key: "fcmToken", value: fcmToken);

    return dioHelper.post(TApiConstants.createAccount, {
      "name" : name,
      "phone" : phone,
      "email" : email,
      "fcm_token" : fcmToken
    }).then((response) => SignupModel.fromJson(response));
  }
}