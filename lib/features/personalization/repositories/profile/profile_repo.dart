import 'package:taha_debts/features/personalization/models/profile/user_profile_model.dart';

abstract class ProfileRepository{
  Future<UserProfileModel> getProfile();
}