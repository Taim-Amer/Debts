import 'package:taha_debts/features/debts/models/debt_schedule/create_debt_model.dart';
import 'package:taha_debts/features/debts/models/debt_schedule/records_model.dart';
import 'package:taha_debts/features/debts/models/debt_schedule/regions_model.dart';

abstract class DebtScheduleRepository{

  Future<RegionsModel> getRegions();

  Future<RecordsModel> getRecords();

  Future<CreateDebtModel> createDebt(String clientName, List<String> clientPhone, int regionId, int recordId, int pageNumber, String amount, String? goodsDescription, int? monthlyPayment, String? sponsorName, String? sponsorPhone, int? sponsorRegionId);
}