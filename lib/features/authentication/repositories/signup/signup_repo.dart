abstract class SignupRepository {
  Future<void> signup(String name, String phone, String email, String fcmToken);
}