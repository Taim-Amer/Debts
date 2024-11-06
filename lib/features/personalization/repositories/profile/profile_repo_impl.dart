import 'package:get/get.dart';
import 'package:taha_debts/features/personalization/models/profile/user_profile_model.dart';
import 'package:taha_debts/features/personalization/repositories/profile/profile_repo.dart';
import 'package:taha_debts/utils/api/dio_helper.dart';
import 'package:taha_debts/utils/constants/api_constants.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class ProfileRepositoryImpl implements ProfileRepository{
  static ProfileRepositoryImpl get instance => Get.find();

  final token = TCacheHelper.getData(key: "token");

  @override
  Future<UserProfileModel> getProfile() async{
    TDioHelper dioHelper = TDioHelper();

    return dioHelper.get(TApiConstants.getUserProfile, token: token).then((response) => UserProfileModel.fromJson(response));
  }

  @override
  Future<void> editProfile(String newName) async{
    TDioHelper dioHelper = TDioHelper();

    return dioHelper.post(TApiConstants.editProfile, {"name" : newName}).then((response) => null);
  }
}