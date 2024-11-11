import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/alerts/toast.dart';
import 'package:taha_debts/features/debts/controllers/client_profile_controller/client_profile_controller.dart';
import 'package:taha_debts/features/debts/repositories/additions/additions_repo_impl.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/logging/logger.dart';

class AdditionsController extends GetxController{
  static AdditionsController get instance => Get.find();

  final amountController = TextEditingController();
  final goodsDescriptionController = TextEditingController();

  final debtAmountController = TextEditingController();
  final debtGoodsDescriptionController = TextEditingController();

  GlobalKey<FormState> paymentAdditionsKey = GlobalKey<FormState>();
  GlobalKey<FormState> debtAdditionsKey = GlobalKey<FormState>();

  var addPaymentApiStatus = RequestState.begin.obs;
  var addDebtApiStatus = RequestState.begin.obs;

  void updatePaymentStatus({required RequestState value}) {
    addPaymentApiStatus.value = value;
  }

  void updateDebtStatus({required RequestState value}) {
    addDebtApiStatus.value = value;
  }

  Future<void> addPayment() async{
    updatePaymentStatus(value: RequestState.loading);

    if (!paymentAdditionsKey.currentState!.validate()) {
        updatePaymentStatus(value: RequestState.begin);
        return;
      }

    int? amount = int.tryParse(amountController.text);
    int id = ClientProfileController.instance.clientProfileModel.value.customer!.id!;

    try{
      final response = await AdditionsRepositoryImpl.instance.addPayment(id, amount!, goodsDescriptionController.text);
      if(response.status == true){
          showToast("تم اضافة عملية الدفع بنجاح", ToastState.success);
        }
    } catch(error){
      TLoggerHelper.error(error.toString());
      showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.error);
    }
  }

  Future<void> addDebt() async{
    updateDebtStatus(value: RequestState.loading);

    if (!debtAdditionsKey.currentState!.validate()) {
      updateDebtStatus(value: RequestState.begin);
      return;
    }

    int? amount = int.tryParse(debtAmountController.text);
    int id = ClientProfileController.instance.clientProfileModel.value.customer!.id!;

    try{
      final response = await AdditionsRepositoryImpl.instance.addDebt(id, amount!, debtGoodsDescriptionController.text);
      if(response.status == true){
        updateDebtStatus(value: RequestState.success);
        showToast("تم اضافة دين جديد بنجاح", ToastState.success);
      }
    } catch(error){
      TLoggerHelper.error(error.toString());
      updateDebtStatus(value: RequestState.onError);
      showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.error);
    }

  }

}