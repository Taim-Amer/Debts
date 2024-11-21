import 'package:taha_debts/features/debts/models/client_profile/client_profile_model.dart';
import 'package:taha_debts/features/debts/models/client_profile/select_reminder_model.dart';
import 'package:taha_debts/features/debts/models/client_profile/update_client_profile_model.dart';

abstract class ClientProfileRepository{

  Future<ClientProfileModel> getClientProfile(int id);

  Future<SelectReminderModel> selectReminder(String? type, String? date, String? note);

  Future<UpdateClientProfileModel> updateProfile({required String status, required int id});
}