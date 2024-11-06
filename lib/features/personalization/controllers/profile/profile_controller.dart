import 'package:get/get.dart';
import 'package:taha_debts/features/personalization/models/profile/user_profile_model.dart';
import 'package:taha_debts/features/personalization/repositories/profile/profile_repo_impl.dart';
import 'package:taha_debts/utils/constants/enums.dart';

class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();

  var getProfileApiStatus = RequestState.begin.obs;
  var userProfile = UserProfileModel().obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getUserProfile();
  }

  void updateStatus({required RequestState value}) {
    getProfileApiStatus.value = value;
  }

  Future<void> getUserProfile() async{
    updateStatus(value: RequestState.loading);

    try{
      userProfile.value = await ProfileRepositoryImpl.instance.getProfile();
      updateStatus(value: RequestState.success);
    } catch(error){
      updateStatus(value: RequestState.onError);
    }
  }
}