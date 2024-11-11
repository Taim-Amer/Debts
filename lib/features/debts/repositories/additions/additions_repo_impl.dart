import 'package:get/get.dart';
import 'package:taha_debts/features/debts/models/additions/add_debt_model.dart';
import 'package:taha_debts/features/debts/models/additions/add_payment_model.dart';
import 'package:taha_debts/features/debts/repositories/additions/additions_repo.dart';
import 'package:taha_debts/utils/api/dio_helper.dart';
import 'package:taha_debts/utils/constants/api_constants.dart';
import 'package:taha_debts/utils/storage/cache_helper.dart';

class AdditionsRepositoryImpl implements AdditionsRepository{
  static AdditionsRepositoryImpl get instance => Get.find();

  final token = TCacheHelper.getData(key: "token");
  
  @override
  Future<AddPaymentModel> addPayment(int clientId, int amount, String goodsDescription) async{
    final dioHelper = TDioHelper();
    return await dioHelper.post(TApiConstants.addPayment, token: token, {"customer_id" : clientId, "amount" : amount, "goods_description" : goodsDescription}).then((response) => AddPaymentModel.fromJson(response));
  }

  @override
  Future<AddDebtModel> addDebt(int clientId, int amount, String goodsDescription) async{
    final dioHelper = TDioHelper();
    return await dioHelper.post(TApiConstants.addDebt, token: token, {"customer_id" : clientId, "amount" : amount, "goods_description" : goodsDescription}).then((response) => AddDebtModel.fromJson(response));
  }
}