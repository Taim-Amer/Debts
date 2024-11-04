class SigninModel {
  String? message;
  bool? isNewAccount;

  SigninModel({this.message, this.isNewAccount});

  SigninModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isNewAccount = json['is_new_account'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['is_new_account'] = isNewAccount;
    return data;
  }
}
