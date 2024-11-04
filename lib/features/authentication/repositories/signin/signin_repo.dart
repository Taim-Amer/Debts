import 'package:taha_debts/features/authentication/models/signin/signin_model.dart';

abstract class SigninRepository {
  Future<SigninModel> signin(String phone);
}
