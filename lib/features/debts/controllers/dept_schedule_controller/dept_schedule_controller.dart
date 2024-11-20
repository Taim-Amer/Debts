import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/alerts/toast.dart';
import 'package:taha_debts/features/debts/controllers/home_controller/home_controller.dart';
import 'package:taha_debts/features/debts/models/debt_schedule/records_model.dart';
import 'package:taha_debts/features/debts/models/debt_schedule/regions_model.dart';
import 'package:taha_debts/features/debts/repositories/debt_schedule/debt_schedule_repo_impl.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/logging/logger.dart';
import 'package:taha_debts/utils/router/app_router.dart';

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
  final anotherNumberController = TextEditingController();

  GlobalKey<FormState> debtScheduleKey = GlobalKey<FormState>();

  RxInt selectedGoodsId = RxInt(1);
  RxInt selectedSponsorId = RxInt(1);
  RxInt selectedClientId = RxInt(1);
  RxBool anotherNumber = RxBool(false);

  var createDebtApiStatus = RequestState.begin.obs;

  void updateStatus({required RequestState value}) {
    createDebtApiStatus.value = value;
  }

  void updateAnotherNumber(){
    anotherNumber.value = !anotherNumber.value;
  }

  Future<void> getRegions() async {
    regionsModel.value = await DebtScheduleRepositoryImpl.instance.getRegions();
  }

  Future<void> getRecords() async {
    recordsModel.value = await DebtScheduleRepositoryImpl.instance.getRecords();
  }

  Future<void> createDebt() async{
    updateStatus(value: RequestState.loading);

    if (!debtScheduleKey.currentState!.validate()) {
      updateStatus(value: RequestState.begin);
      return;
    }

    int? pageNumber = int.tryParse(pageNumberController.text);
    int? monthlyPayment = int.tryParse(monthlyPaymentController.text);

    List<String> phoneList = [];
    phoneList.add(clientNumberController.text);
    if (anotherNumberController.text.isNotEmpty) {
      phoneList.add(anotherNumberController.text);
    }

    // phoneList.addIf(anotherNumberController.text != null ,anotherNumberController.text);

    try{
      await DebtScheduleRepositoryImpl.instance.createDebt(clientNameController.text, phoneList, selectedClientId.value, selectedGoodsId.value, pageNumber!, amountController.text, goodsDescriptionController.text, monthlyPayment, sponsorNameController.text, sponsorNumberController.text, selectedSponsorId.value);
      HomeController.instance.getMyDebts(null);
      updateStatus(value: RequestState.success);
      showToast(TranslationKey.kNewDebtCreateMessage, ToastState.success);
      Get.offAllNamed(AppRoutes.home);
    }catch (error){
      TLoggerHelper.error(error.toString());
      showToast(TranslationKey.kErrorMessage, ToastState.error);
      updateStatus(value: RequestState.onError);
    }
  }

  Future<void> addNewDebtItem() async {
    int pageNumber = int.tryParse(pageNumberController.text) ?? Random().nextInt(100);
    int? monthlyPayment = int.tryParse(monthlyPaymentController.text);

    List<String> phoneList = [];

    phoneList.add(clientNumberController.text);
    if (anotherNumberController.text.isNotEmpty) {
      phoneList.add(anotherNumberController.text);
    }

    try {
      final response = await DebtScheduleRepositoryImpl.instance.createDebt(
        clientNameController.text,
        phoneList,
        selectedClientId.value,
        selectedGoodsId.value,
        pageNumber,
        amountController.text,
        goodsDescriptionController.text,
        monthlyPayment,
        sponsorNameController.text,
        sponsorNumberController.text.toString(),
        selectedSponsorId.value,
      );

      if (response.status == true) {
        HomeController.instance.getMyDebts(null);
        updateStatus(value: RequestState.success);
        showToast(TranslationKey.kNewDebtCreateMessage, ToastState.success);
        Get.offAndToNamed(AppRoutes.debtSchedule);
      } else if (response.status == null) {
        showToast("يجب اكمال هذا الطلب اولا", ToastState.warning);
      }
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 422) {
        showToast("يجب اكمال هذا الطلب اولا", ToastState.warning);
      }
    }
  }
}
