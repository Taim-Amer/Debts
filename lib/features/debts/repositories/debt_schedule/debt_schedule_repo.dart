import 'package:taha_debts/features/debts/models/debt_schedule/records_model.dart';
import 'package:taha_debts/features/debts/models/debt_schedule/regions_model.dart';

abstract class DebtScheduleRepository{

  Future<RegionsModel> getRegions();

  Future<RecordsModel> getRecords();
}