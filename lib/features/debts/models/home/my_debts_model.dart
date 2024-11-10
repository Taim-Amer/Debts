class MyDebtsModel {
  bool? status;
  Data? data;
  List<Debts>? debts;

  MyDebtsModel({this.status, this.data, this.debts});

  MyDebtsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    if (json['debts'] != null) {
      debts = <Debts>[];
      json['debts'].forEach((v) {
        debts!.add(Debts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (debts != null) {
      data['debts'] = debts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? totalAmount;
  int? totalCount;
  int? totalPayment;

  Data({this.totalAmount, this.totalCount, this.totalPayment});

  Data.fromJson(Map<String, dynamic> json) {
    totalAmount = json['total_amount'];
    totalCount = json['total_count'];
    totalPayment = json['total_payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_amount'] = totalAmount;
    data['total_count'] = totalCount;
    data['total_payment'] = totalPayment;
    return data;
  }
}

class Debts {
  int? id;
  String? name;
  String? status;
  int? amount;
  String? lastUpdate;

  Debts({this.id, this.name, this.status, this.amount, this.lastUpdate});

  Debts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    amount = json['amount'];
    lastUpdate = json['last_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['amount'] = amount;
    data['last_update'] = lastUpdate;
    return data;
  }
}
