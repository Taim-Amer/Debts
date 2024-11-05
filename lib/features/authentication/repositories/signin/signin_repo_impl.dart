// ignore_for_file: invalid_return_type_for_catch_error

import 'dart:async';
import 'package:get/get.dart';
import 'package:taha_debts/features/authentication/models/signin/signin_model.dart';
import 'package:taha_debts/features/authentication/repositories/signin/signin_repo.dart';
import 'package:taha_debts/utils/api/dio_helper.dart';
import 'package:taha_debts/utils/constants/api_constants.dart';

class SigninRepositoryImpl implements SigninRepository {
  static SigninRepositoryImpl get instance => Get.find();

  @override
  Future<SigninModel> signin(String phone) async {
    TDioHelper dioHelper = TDioHelper();

    return dioHelper.post(TApiConstants.checkPhone, {"phone" : phone})
        .then((response) => SigninModel.fromJson(response));
  }
}
