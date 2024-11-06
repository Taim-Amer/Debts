import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taha_debts/common/widgets/alerts/toast.dart';
import 'package:taha_debts/features/personalization/models/profile/user_profile_model.dart';
import 'package:taha_debts/features/personalization/repositories/profile/profile_repo_impl.dart';
import 'package:taha_debts/utils/constants/enums.dart';

class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();

  var getProfileApiStatus = RequestState.begin.obs;
  var editProfileApiStatus = RequestState.begin.obs;

  final newNameController = TextEditingController();
  var userProfile = UserProfileModel().obs;
  GlobalKey<FormState> profileKey = GlobalKey<FormState>();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getUserProfile();
  }

  void updateGetProfileStatus({required RequestState value}) {
    getProfileApiStatus.value = value;
  }

  void updateEditProfileStatus({required RequestState value}) {
    editProfileApiStatus.value = value;
  }

  Future<void> getUserProfile() async{
    updateGetProfileStatus(value: RequestState.loading);

    try{
      userProfile.value = await ProfileRepositoryImpl.instance.getProfile();
      updateGetProfileStatus(value: RequestState.success);
    } catch(error){
      updateGetProfileStatus(value: RequestState.onError);
    }
  }

  Future<void> editProfile() async{

    if(!profileKey.currentState!.validate()) return;
    updateEditProfileStatus(value: RequestState.loading);
    
    await ProfileRepositoryImpl.instance.editProfile(newNameController.text).then((response) => print(""));
    updateEditProfileStatus(value: RequestState.success);
    showToast("تم تعديل الاسم بنجاح", ToastState.success);
    Get.back();
    await getUserProfile();
  }
}