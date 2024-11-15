import 'package:taha_debts/features/debts/models/home/my_debts_model.dart';

abstract class HomeRepository{

  Future<MyDebtsModel> getMyDebts(String? filter, int? region, String? name);
}