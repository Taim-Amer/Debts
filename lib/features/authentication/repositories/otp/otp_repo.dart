import 'package:taha_debts/features/authentication/models/otp/otp_model.dart';
import 'package:taha_debts/features/authentication/models/otp/resend_otp_model.dart';

abstract class OtpRepository {

  Future<OtpModel> verify(String phone, String code);

  Future<ResendOtpModel> resendCode(String phone);
}