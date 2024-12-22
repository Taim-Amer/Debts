// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:taha_debts/features/debts/models/debt_schedule/create_debt_model.dart';
import 'package:taha_debts/features/debts/models/debt_schedule/records_model.dart';
import 'package:taha_debts/features/debts/models/debt_schedule/regions_model.dart';
import 'package:taha_debts/features/debts/repositories/debt_schedule/debt_schedule_repo.dart';
import 'package:taha_debts/utils/api/dio_helper.dart';
import 'package:taha_debts/utils/constants/api_constants.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class DebtScheduleRepositoryImpl implements DebtScheduleRepository {
  static DebtScheduleRepositoryImpl get instance => Get.find();

  final token = TCacheHelper.getData(key: "token");

  @override
  Future<RegionsModel> getRegions() async {
    final dioHelper = TDioHelper();
    return await dioHelper.get(TApiConstants.getRegions, token: token).then((response) => RegionsModel.fromJson(response));
  }

  @override
  Future<RecordsModel> getRecords() async {
    final dioHelper = TDioHelper();
    return await dioHelper.get(TApiConstants.getRecords, token: token).then((response) => RecordsModel.fromJson(response));
  }

  @override
  Future<CreateDebtModel> createDebt(String clientName, List<String> clientPhone, int regionId, int recordId, int pageNumber, String amount, String? goodsDescription, int? monthlyPayment, String? sponsorName, String? sponsorPhone, int? sponsorRegionId) async{
    final dioHelper = TDioHelper();
    return await dioHelper.post(TApiConstants.createDebt, token: token,{
      "customer_name": clientName,
      "customer_phone": clientPhone,
      "region_id": regionId,
      "record_id": recordId,
      "page_number": pageNumber,
      "amount": amount,
      "goods_description": goodsDescription,
      "monthly_payment": monthlyPayment ?? 0,
      "sponsor_name": sponsorName,
      "sponsor_phone": sponsorPhone,
      "sponsor_region": sponsorRegionId,
    }).then((response) => CreateDebtModel.fromJson(response));
  }
}
