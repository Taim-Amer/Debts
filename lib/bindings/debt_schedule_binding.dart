import 'package:get/get.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/features/debts/repositories/debt_schedule/debt_schedule_repo_impl.dart';

class DebtScheduleBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(DebtScheduleController());
    Get.put(DebtScheduleRepositoryImpl());
  }
}