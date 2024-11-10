import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/alerts/toast.dart';
import 'package:taha_debts/features/debts/models/client_profile/client_profile_model.dart';
import 'package:taha_debts/features/debts/repositories/client_profile/client_profile_repo_impl.dart';
import 'package:taha_debts/utils/constants/enums.dart';
import 'package:taha_debts/utils/logging/logger.dart';

class ClientProfileController extends GetxController{
  static ClientProfileController get instance => Get.find();

  var selectedValue = Rx<int?>(null);
  var getClientProfileStatus = RequestState.begin.obs;
  final clientProfileModel = ClientProfileModel().obs;

  void updateStatus({required RequestState value}) {
    getClientProfileStatus.value = value;
  }
  
  Future<void> getClientProfile(int id) async{
    updateStatus(value: RequestState.loading);

    try{
      clientProfileModel.value = await ClientProfileRepositoryImpl.instance.getClientProfile(id);
      updateStatus(value: RequestState.success);
    }catch(error){
      TLoggerHelper.warning(error.toString());
      updateStatus(value: RequestState.onError);
      showToast("حدث خطأ ما يرجى اعادة المحاولة", ToastState.error);
    }
  }
}