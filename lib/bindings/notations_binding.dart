import 'package:get/get.dart';
import 'package:taha_debts/features/notations/controllers/notations_controller.dart';
import 'package:taha_debts/features/notations/repositories/notations_repo_impl.dart';

class NotationsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<NotationsController>(NotationsController());
    Get.put<NotationsRepositoryImpl>(NotationsRepositoryImpl());
  }
}