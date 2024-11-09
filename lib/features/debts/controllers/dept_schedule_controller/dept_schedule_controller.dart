import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taha_debts/features/debts/models/debt_schedule/records_model.dart';
import 'package:taha_debts/features/debts/models/debt_schedule/regions_model.dart';
import 'package:taha_debts/features/debts/repositories/debt_schedule/debt_schedule_repo_impl.dart';

class DebtScheduleController extends GetxController {
  static DebtScheduleController get instance => Get.find();

  RxString clientAddress = "دمشق".obs;
  RxString sponsorAddress = "دمشق".obs;
  RxString goodsRecord = "سجل الاثاث".obs;

  Rx<RegionsModel> regionsModel = RegionsModel().obs;
  Rx<RecordsModel> recordsModel = RecordsModel().obs;

  final clientNameController = TextEditingController();
  final clientNumberController = TextEditingController();
  final pageNumberController = TextEditingController();
  final sponsorNumberController = TextEditingController();
  final goodsDescriptionController = TextEditingController();
  final initialPaymentController = TextEditingController();
  final monthlyPaymentController = TextEditingController();
  final amountController = TextEditingController();
  final sponsorNameController = TextEditingController();

  GlobalKey<FormState> debtScheduleKey = GlobalKey<FormState>();

  RxInt selectedGoodsId = RxInt(0);
  RxInt selectedSponsorId = RxInt(0);
  RxInt selectedClientId = RxInt(0);

  Future<void> getRegions() async {
    regionsModel.value = await DebtScheduleRepositoryImpl.instance.getRegions();
  }

  Future<void> getRecords() async {
    recordsModel.value = await DebtScheduleRepositoryImpl.instance.getRecords();
  }

  Future<void> createDebt() async{

  }
}
