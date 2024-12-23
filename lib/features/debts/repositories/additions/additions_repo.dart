import 'package:taha_debts/features/debts/models/additions/add_debt_model.dart';
import 'package:taha_debts/features/debts/models/additions/add_payment_model.dart';

abstract class AdditionsRepository{

  Future<AddPaymentModel> addPayment(int clientId, int amount, String goodsDescription);

  Future<AddDebtModel> addDebt(int clientId, int amount, String goodsDescription);
}