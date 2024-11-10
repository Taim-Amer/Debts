import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/alerts/toast.dart';
import 'package:taha_debts/features/debts/repositories/home/home_repo_impl.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/logging/logger.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  RxBool isTotalDebtorsSelected = false.obs;
  RxBool isAllSelected = true.obs;
  RxBool isTotalReceivedSelected = false.obs;
  RxBool isSettledSelected = false.obs;


  var getDebtsApiStatus = RequestState.begin.obs;

  @override
  void onReady() {
    super.onReady();
    getMyDebts(null);
  }

  void updateStatus({required RequestState value}) {
    getDebtsApiStatus.value = value;
  }

  Future<void> getMyDebts(String? filter) async{
    updateStatus(value: RequestState.loading);

    try{
      final response = await HomeRepositoryImpl.instance.getMyDebts(filter);
      if(response.status == true && response.debts!.isNotEmpty){
        updateStatus(value: RequestState.success);
      } else if(response.debts!.isEmpty){
        updateStatus(value: RequestState.noData);
      }
    } catch(error){
      TLoggerHelper.debug(error.toString());
      TLoggerHelper.error(error.toString());
      TLoggerHelper.info(error.toString());
      TLoggerHelper.warning(error.toString());
      updateStatus(value: RequestState.onError);
      showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.error);
    }
  }

}
