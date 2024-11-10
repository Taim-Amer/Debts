import 'package:taha_debts/features/debts/models/client_profile/client_profile_model.dart';

abstract class ClientProfileRepository{
  Future<ClientProfileModel> getClientProfile(int id);
}