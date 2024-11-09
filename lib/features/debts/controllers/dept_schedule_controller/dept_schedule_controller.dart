import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/alerts/toast.dart';
import 'package:taha_debts/features/debts/models/debt_schedule/records_model.dart';
import 'package:taha_debts/features/debts/models/debt_schedule/regions_model.dart';
import 'package:taha_debts/features/debts/repositories/debt_schedule/debt_schedule_repo_impl.dart';
import 'package:taha_debts/utils/constants/enums.dart';
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

  GlobalKey<FormState> debtScheduleKey = GlobalKey<FormState>();

  RxInt selectedGoodsId = RxInt(1);
  RxInt selectedSponsorId = RxInt(1);
  RxInt selectedClientId = RxInt(1);

  var createDebtApiStatus = RequestState.begin.obs;

  void updateStatus({required RequestState value}) {
    createDebtApiStatus.value = value;
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

    print('Client Name: ${clientNameController.text}');
    print('Client Number: ${clientNumberController.text}');
    print('Selected Client ID: ${selectedClientId.value}');
    print('Selected Goods ID: ${selectedGoodsId.value}');
    print('Page Number: $pageNumber');
    print('Amount: ${amountController.text}');
    print('Goods Description: ${goodsDescriptionController.text}');
    print('Monthly Payment: ${monthlyPaymentController.text}');
    print('Sponsor Name: ${sponsorNameController.text}');
    print('Sponsor Number: ${sponsorNumberController.text}');
    print('Selected Sponsor ID: ${selectedSponsorId.value}');

    try{
      await DebtScheduleRepositoryImpl.instance.createDebt(clientNameController.text, clientNumberController.text, selectedClientId.value, selectedGoodsId.value, pageNumber!, amountController.text, goodsDescriptionController.text, monthlyPaymentController.text, sponsorNameController.text, sponsorNumberController.text, selectedSponsorId.value);
      updateStatus(value: RequestState.success);
      showToast("تم اضافة دين جديد", ToastState.success);
      Get.offAllNamed(AppRoutes.home);
    }catch (error){
      showToast("حدث خطأ ما يرجى التأكد من البيانات المدخلة ثم اعادة المحاولة", ToastState.error);
      updateStatus(value: RequestState.onError);
    }
  }
}
