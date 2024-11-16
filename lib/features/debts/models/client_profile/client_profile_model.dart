class ClientProfileModel {
  Customer? customer;
  List<Payments>? payments;

  ClientProfileModel({this.customer, this.payments});

  ClientProfileModel.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(Payments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (payments != null) {
      data['payments'] = payments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customer {
  int? id;
  String? name;
  List<String>? phone;
  int? regionId;
  String? status;
  String? customerRegion;
  int? pageNumber;
  Sponsor? sponsor; // Keep it as Sponsor but handle dynamic values.

  Customer({
    this.id,
    this.name,
    this.phone,
    this.regionId,
    this.status,
    this.customerRegion,
    this.pageNumber,
    this.sponsor,
  });

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = List<String>.from(json['phone'] ?? []); // Safely cast phone list
    regionId = json['region_id'];
    status = json['status'];
    customerRegion = json['customer_region'];
    pageNumber = json['page_number'];

    // Handle the sponsor field dynamically
    if (json['sponsor'] is Map<String, dynamic>) {
      sponsor = Sponsor.fromJson(json['sponsor']);
    } else if (json['sponsor'] is List && (json['sponsor'] as List).isEmpty) {
      sponsor = null; // Empty list treated as no sponsor
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['region_id'] = regionId;
    data['status'] = status;
    data['customer_region'] = customerRegion;
    data['page_number'] = pageNumber;

    // Include sponsor only if it's not null
    if (sponsor != null) {
      data['sponsor'] = sponsor!.toJson();
    }
    return data;
  }
}

class Sponsor {
  String? sponsorName;
  String? sponsorPhone;
  String? sponsorRegion;

  Sponsor({this.sponsorName, this.sponsorPhone, this.sponsorRegion});

  Sponsor.fromJson(Map<String, dynamic> json) {
    sponsorName = json['sponsor_name'];
    sponsorPhone = json['sponsor_phone'];
    sponsorRegion = json['sponsor_region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sponsor_name'] = sponsorName;
    data['sponsor_phone'] = sponsorPhone;
    data['sponsor_region'] = sponsorRegion;
    return data;
  }
}

class Payments {
  String? date;
  int? afterPay;
  String? goodsDescription;
  int? amount;
  String? type;

  Payments(
      {this.date,
        this.afterPay,
        this.goodsDescription,
        this.amount,
        this.type});

  Payments.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    afterPay = json['after_pay'];
    goodsDescription = json['goods_description'];
    amount = json['amount'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['after_pay'] = afterPay;
    data['goods_description'] = goodsDescription;
    data['amount'] = amount;
    data['type'] = type;
    return data;
  }
}
