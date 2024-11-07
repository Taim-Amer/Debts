import 'package:get/get.dart';
import 'package:taha_debts/features/debts/models/debt_schedule/regions_model.dart';
import 'package:taha_debts/features/debts/repositories/debt_schedule/debt_schedule_repo_impl.dart';

class DebtScheduleController extends GetxController{
  static DebtScheduleController get instance => Get.find();

  RxString clientAddress = "دمشق".obs;
  // var regionsModel = RegionsModel().obs;
  RxList<Data> regionsList = <Data>[].obs;

  // @override
  // void onReady() {
  //   // TODO: implement onReady
  //   super.onReady();
  //   getRegions();
  // }

  Future<void> getRegions() async{
    final fetchedRegions = await DebtScheduleRepositoryImpl.instance.getRegions();
    regionsList.assignAll(fetchedRegions.data ?? []);
    // regionsModel.value = await DebtScheduleRepositoryImpl.instance.getRegions();
  }
}