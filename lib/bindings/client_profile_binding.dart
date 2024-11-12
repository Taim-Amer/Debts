import 'package:get/get.dart';
import 'package:taha_debts/features/debts/controllers/client_profile_controller/client_profile_controller.dart';
import 'package:taha_debts/features/debts/controllers/client_profile_controller/date_picker_controller.dart';
import 'package:taha_debts/features/debts/repositories/client_profile/client_profile_repo_impl.dart';

class ClientProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ClientProfileController());
    Get.put(ClientProfileRepositoryImpl());
    Get.put(DatePickerController());
  }
}