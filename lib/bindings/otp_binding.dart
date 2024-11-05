import 'package:get/get.dart';
import 'package:taha_debts/features/authentication/controllers/otp/otp_controller.dart';
import 'package:taha_debts/features/authentication/repositories/otp/otp_repo.dart';
import 'package:taha_debts/features/authentication/repositories/otp/otp_repo_impl.dart';

class OtpBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(OtpController());
    Get.put(OtpRepositoryImpl());
  }
}