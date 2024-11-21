import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:taha_debts/features/authentication/models/signin/signin_model.dart';
import 'package:taha_debts/features/authentication/repositories/signin/signin_repo.dart';
import 'package:taha_debts/utils/api/dio_helper.dart';
import 'package:taha_debts/utils/constants/api_constants.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class SigninRepositoryImpl implements SigninRepository {
  static SigninRepositoryImpl get instance => Get.find();

  @override
  Future<SigninModel> signin(String phone) async {
    TDioHelper dioHelper = TDioHelper();
    String? fcmToken = (await FirebaseMessaging.instance.getToken())?.trim();
    TCacheHelper.saveData(key: "fcmToken", value: fcmToken);
    return dioHelper.post(TApiConstants.checkPhone, {"phone" : phone, "fcm_token" : fcmToken}).then((response) => SigninModel.fromJson(response));
  }
}
