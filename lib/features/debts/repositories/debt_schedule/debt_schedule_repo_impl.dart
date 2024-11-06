import 'package:get/get.dart';
import 'package:taha_debts/features/debts/models/debt_schedule/regions_model.dart';
import 'package:taha_debts/features/debts/repositories/debt_schedule/debt_schedule_repo.dart';
import 'package:taha_debts/utils/api/dio_helper.dart';
import 'package:taha_debts/utils/constants/api_constants.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class DebtScheduleRepositoryImpl implements DebtScheduleRepository{
  static DebtScheduleRepositoryImpl get instance => Get.find();

  final token = TCacheHelper.getData(key: "token");

  @override
  Future<RegionsModel> getRegions() async{
    TDioHelper dioHelper = TDioHelper();
    return await dioHelper.get(TApiConstants.getRegions, token: token).then((response) => RegionsModel.fromJson(response));
  }

}