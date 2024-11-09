import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/alerts/toast.dart';
import 'package:taha_debts/features/debts/repositories/additions/additions_repo_impl.dart';
import 'package:taha_debts/utils/constants/enums.dart';

class AdditionsController extends GetxController{
  static AdditionsController get instance => Get.find();

  final amountController = TextEditingController();
  final goodsDescriptionController = TextEditingController();

  GlobalKey<FormState> additionsKey = GlobalKey<FormState>();

  var addPaymentApiStatus = RequestState.begin.obs;

  void updateStatus({required RequestState value}) {
    addPaymentApiStatus.value = value;
  }

  Future<void> addPayment() async{
    if (!additionsKey.currentState!.validate()) {
      updateStatus(value: RequestState.begin);
      return;
    }

    updateStatus(value: RequestState.loading);

    int? amount = int.tryParse(amountController.text);
    try{
      final response = await AdditionsRepositoryImpl.instance.addPayment(1, amount!, goodsDescriptionController.text);
      if(response.status == true){
        showToast("تم اضافة عملية الدفع بنجاح", ToastState.success);
      }

      //Nav===================
    } catch(error){
      showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.error);
    }
  }
}