import 'package:get/get.dart';
import 'package:taha_debts/features/debts/models/client_profile/client_profile_model.dart';
import 'package:taha_debts/features/debts/models/client_profile/select_reminder_model.dart';
import 'package:taha_debts/features/debts/repositories/client_profile/client_profile_repo.dart';
import 'package:taha_debts/utils/api/dio_helper.dart';
import 'package:taha_debts/utils/constants/api_constants.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class ClientProfileRepositoryImpl implements ClientProfileRepository{
  static ClientProfileRepositoryImpl get instance => Get.find();

  final token = TCacheHelper.getData(key: "token");

  @override
  Future<ClientProfileModel> getClientProfile(int id) async{
    final dioHelper = TDioHelper();
    return await dioHelper.get("${TApiConstants.getClientProfile}/$id", token: token).then((response) => ClientProfileModel.fromJson(response));
  }

  @override
  Future<SelectReminderModel> selectReminder(String? type, String? date, String? note) async{
    final dioHelper = TDioHelper();
    return await dioHelper.post(TApiConstants.selectReminder, token: token, {"type" : type, "reminder_date" : date, "note" : note}).then((response) => SelectReminderModel.fromJson(response));
  }
}