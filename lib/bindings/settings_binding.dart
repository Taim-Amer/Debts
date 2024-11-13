import 'package:get/get.dart';
import 'package:taha_debts/features/personalization/controllers/settings/settings_controller.dart';

class SettingsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<SettingsController>(SettingsController());
  }
}