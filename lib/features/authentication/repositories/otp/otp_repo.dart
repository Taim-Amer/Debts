import 'package:taha_debts/features/authentication/models/otp/otp_model.dart';

abstract class OtpRepository {
  Future<OtpModel> verify(String phone, int code);
}