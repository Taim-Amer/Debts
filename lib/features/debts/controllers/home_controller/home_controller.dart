import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/alerts/toast.dart';
import 'package:taha_debts/features/debts/models/home/my_debts_model.dart';
import 'package:taha_debts/features/debts/repositories/home/home_repo_impl.dart';
import 'package:taha_debts/features/notations/controllers/notations_controller.dart';
import 'package:taha_debts/features/personalization/controllers/profile/profile_controller.dart';
import 'package:taha_debts/localization/keys.dart';
import 'package:taha_debts/utils/constants/enums.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  RxBool isTotalDebtorsSelected = false.obs;
  RxBool isAllSelected = true.obs;
  RxBool isTotalReceivedSelected = false.obs;
  RxBool isSettledSelected = false.obs;
  RxBool isExpanded = false.obs;
  RxInt? region;
  final myDebtsModel = MyDebtsModel().obs;
  final nameController = TextEditingController();

  var getDebtsApiStatus = RequestState.begin.obs;
  var searchNameApiStatus = RequestState.begin.obs;

  @override
  void onReady() {
    getMyDebts(null);
    NotationsController.instance.getNotes();
    ProfileController.instance.getUserProfile();
    super.onReady();
  }

  void updateStatus({required RequestState value}) {
    getDebtsApiStatus.value = value;
  }

  void searchNameUpdateStatus({required RequestState value}) {
    searchNameApiStatus.value = value;
  }

  void setExpanded(){
    isExpanded.value = !isExpanded.value;
  }

  Future<void> getMyDebts(String? filter) async{
    updateStatus(value: RequestState.loading);

    try{
      myDebtsModel.value = await HomeRepositoryImpl.instance.getMyDebts(filter, null, null);
      if(myDebtsModel.value.status == true && myDebtsModel.value.debts!.isNotEmpty){
        updateStatus(value: RequestState.success);
      } else if(myDebtsModel.value.debts!.isEmpty){
        updateStatus(value: RequestState.noData);
      }
    } catch(error){
      updateStatus(value: RequestState.onError);
      showToast(TranslationKey.kErrorMessage, ToastState.success);
    }
  }

  void selectFilter(int index) {
    isAllSelected.value = index == 0;
    isTotalDebtorsSelected.value = index == 1;
    isTotalReceivedSelected.value = index == 2;
    isSettledSelected.value = index == 3;
    debtFilter();
  }

  Future<void> debtFilter() async{
    if(isAllSelected.value == true){
      await getMyDebts(null);
    }
    if(isTotalDebtorsSelected.value == true){
      await getMyDebts("total_debtors");
    }
    if(isTotalReceivedSelected.value == true){
      await getMyDebts("total_receipts");
    }
    if(isSettledSelected.value == true){
      await getMyDebts("receipts_done");
    }
  }

  Future<void> nameSearch(int? regionID) async{
    searchNameUpdateStatus(value: RequestState.loading);
    try{
      myDebtsModel.value = await HomeRepositoryImpl.instance.getMyDebts(null, regionID, nameController.text.toString());
      region?.value = regionID!;
      if(myDebtsModel.value.debts!.isNotEmpty){
        searchNameUpdateStatus(value: RequestState.success);
      } else if(myDebtsModel.value.debts!.isEmpty){
        searchNameUpdateStatus(value: RequestState.noData);
      }
    }catch(error) {
      searchNameUpdateStatus(value: RequestState.onError);
      showToast(TranslationKey.kErrorMessage, ToastState.success);
    }
  }
}
