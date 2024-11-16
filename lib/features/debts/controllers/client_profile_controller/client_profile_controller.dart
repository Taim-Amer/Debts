import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/alerts/toast.dart';
import 'package:taha_debts/features/debts/controllers/client_profile_controller/date_picker_controller.dart';
import 'package:taha_debts/features/debts/models/client_profile/client_profile_model.dart';
import 'package:taha_debts/features/debts/repositories/client_profile/client_profile_repo_impl.dart';
import 'package:taha_debts/features/notations/controllers/notations_controller.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/logging/logger.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class ClientProfileController extends GetxController{
  static ClientProfileController get instance => Get.find();

  var selectedValue = ValueNotifier<int?>(null);
  var getClientProfileStatus = RequestState.begin.obs;
  final clientProfileModel = ClientProfileModel().obs;
  final noteController = TextEditingController();

  void updateStatus({required RequestState value}) {
    getClientProfileStatus.value = value;
  }
  
  Future<void> getClientProfile(int id) async{
    updateStatus(value: RequestState.loading);

    try{
      clientProfileModel.value = await ClientProfileRepositoryImpl.instance.getClientProfile(id);
      updateStatus(value: RequestState.success);
      TCacheHelper.saveData(key: "client_id", value: id);
    }catch(error){
      TLoggerHelper.warning(error.toString());
      updateStatus(value: RequestState.onError);
      showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.error);
    }
  }

  Future<void> selectReminder() async{
    String type = "specific_date";
    if(selectedValue.value == 1){
      type = "weekly";
    }else if(selectedValue.value == 2){
      type = "monthly";
    }

    try{
      await ClientProfileRepositoryImpl.instance.selectReminder(type, type == "specific_date" ? DatePickerController.instance.selectedDate.toString() : null, noteController.text.toString());
      if(type == "specific_date"){
        TCacheHelper.saveData(key: "collection_date", value: DatePickerController.instance.selectedDate);
      }
      showToast("تم اضافة التنبيه بنجاح", ToastState.success);
      Get.back();
    } catch(error){
      TLoggerHelper.debug(error.toString());
    }
  }
}