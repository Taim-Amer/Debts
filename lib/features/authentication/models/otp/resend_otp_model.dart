class ResendOtpModel {
  String? message;
  Null data;
  String? status;
  int? code;

  ResendOtpModel({this.message, this.data, this.status, this.code});

  ResendOtpModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
    status = json['status'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['data'] = this.data;
    data['status'] = status;
    data['code'] = code;
    return data;
  }
}
