class OtpModel {
  String? massage;
  String? token;

  OtpModel({this.massage, this.token});

  OtpModel.fromJson(Map<String, dynamic> json) {
    massage = json['massage'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['massage'] = this.massage;
    data['token'] = this.token;
    return data;
  }
}
