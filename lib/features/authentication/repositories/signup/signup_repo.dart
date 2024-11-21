import 'package:taha_debts/features/authentication/models/signup/signup_model.dart';

abstract class SignupRepository {
  Future<SignupModel> signup(String name, String phone, String email);
}