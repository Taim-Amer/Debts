class UpdateClientProfileModel {
  bool? status;
  String? message;

  UpdateClientProfileModel({this.status, this.message});

  UpdateClientProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
