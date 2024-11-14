import 'package:get/get.dart';
import 'package:taha_debts/features/debts/controllers/client_profile_controller/client_profile_controller.dart';
import 'package:taha_debts/features/debts/controllers/client_profile_controller/date_picker_controller.dart';
import 'package:taha_debts/features/debts/controllers/dept_schedule_controller/dept_schedule_controller.dart';
import 'package:taha_debts/features/debts/controllers/home_controller/home_controller.dart';
import 'package:taha_debts/features/debts/repositories/client_profile/client_profile_repo_impl.dart';
import 'package:taha_debts/features/debts/repositories/debt_schedule/debt_schedule_repo_impl.dart';
import 'package:taha_debts/features/debts/repositories/home/home_repo_impl.dart';
import 'package:taha_debts/features/notations/controllers/notations_controller.dart';
import 'package:taha_debts/features/notations/repositories/notations_repo_impl.dart';
import 'package:taha_debts/features/personalization/controllers/profile/profile_controller.dart';
import 'package:taha_debts/features/personalization/repositories/profile/profile_repo_impl.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {

    // من احل اسم المستخدم يلي بالهوم
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => ProfileRepositoryImpl());
    
    Get.put<HomeController>(HomeController());
    Get.put<HomeRepositoryImpl>(HomeRepositoryImpl());

    Get.lazyPut<DebtScheduleController>(() => DebtScheduleController());
    Get.lazyPut<DebtScheduleRepositoryImpl>(() => DebtScheduleRepositoryImpl());

    Get.put(DatePickerController());

    Get.lazyPut<NotationsController>(() => NotationsController());
    Get.lazyPut<NotationsRepositoryImpl>(() => NotationsRepositoryImpl());

    Get.lazyPut<ClientProfileController>(() => ClientProfileController());
    Get.lazyPut<ClientProfileRepositoryImpl>(() => ClientProfileRepositoryImpl());
    
    // Get.lazyPut<DatePickerController>(() => DatePickerController());
  }
}