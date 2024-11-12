import 'package:get/get.dart';
import 'package:taha_debts/features/debts/models/home/my_debts_model.dart';
import 'package:taha_debts/features/debts/repositories/home/home_repo.dart';
import 'package:taha_debts/utils/api/dio_helper.dart';
import 'package:taha_debts/utils/constants/api_constants.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class HomeRepositoryImpl implements HomeRepository {
  static HomeRepositoryImpl get instance => Get.find();

  final token = TCacheHelper.getData(key: "token");

  @override
  Future<MyDebtsModel> getMyDebts(String? filter) async {
    final dioHelper = TDioHelper();
    return await dioHelper.get(TApiConstants.getMyDebts, token: token, queryParameters: {"": filter}).then((response) => MyDebtsModel.fromJson(response));
  }
}
