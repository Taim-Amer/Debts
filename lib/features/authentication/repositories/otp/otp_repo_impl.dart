// ignore_for_file: invalid_return_type_for_catch_error

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:taha_debts/features/authentication/models/otp/otp_model.dart';
import 'package:taha_debts/features/authentication/repositories/otp/otp_repo.dart';
import 'package:taha_debts/utils/api/dio_helper.dart';
import 'package:taha_debts/utils/constants/api_constants.dart';

class OtpRepositoryImpl implements OtpRepository{
  static OtpRepositoryImpl get instance => Get.find();

  @override
  Future<OtpModel> verify(String phone, String code) async {
    TDioHelper dioHelper = TDioHelper();
    return dioHelper.post(TApiConstants.verifyOtp, {"phone" : phone, "code" : code})
    .then((response) => OtpModel.fromJson(response))
    .catchError((error) => print(error));
  }
}