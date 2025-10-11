import 'dart:convert';

class CustomersResponseModel {
  final bool? success;
  final String? message;
  final List<Customer>? data;

  CustomersResponseModel({this.success, this.message, this.data});

  factory CustomersResponseModel.fromRawJson(String str) =>
      CustomersResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomersResponseModel.fromJson(Map<String, dynamic> json) =>
      CustomersResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Customer>.from(
                json["data"]!.map((x) => Customer.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Customer {
  final int? id;
  final String? name;
  final String? address;
  final String? status;
  final String? phone;
  final String? branchCode;
  final List<int>? prizes;
  final bool? received;
  final dynamic receivedDate;
  final dynamic failedReason;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<PrizeObject>? prizeObjects;

  Customer({
    this.id,
    this.name,
    this.address,
    this.status,
    this.phone,
    this.branchCode,
    this.prizes,
    this.received,
    this.receivedDate,
    this.failedReason,
    this.createdAt,
    this.updatedAt,
    this.prizeObjects,
  });

  factory Customer.fromRawJson(String str) =>
      Customer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    status: json["status"],
    phone: json["phone"],
    branchCode: json["branch_code"],
    prizes: json["prizes"] == null
        ? []
        : List<int>.from(json["prizes"]!.map((x) => x)),
    received: json["received"],
    receivedDate: json["received_date"],
    failedReason: json["failed_reason"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    prizeObjects: json["prize_objects"] == null
        ? []
        : List<PrizeObject>.from(
            json["prize_objects"]!.map((x) => PrizeObject.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "status": status,
    "phone": phone,
    "branch_code": branchCode,
    "prizes": prizes == null ? [] : List<dynamic>.from(prizes!.map((x) => x)),
    "received": received,
    "received_date": receivedDate,
    "failed_reason": failedReason,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "prize_objects": prizeObjects == null
        ? []
        : List<dynamic>.from(prizeObjects!.map((x) => x.toJson())),
  };
}

class PrizeObject {
  final int? id;
  final String? code;
  final String? title;
  final int? qty;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PrizeObject({
    this.id,
    this.code,
    this.title,
    this.qty,
    this.createdAt,
    this.updatedAt,
  });

  factory PrizeObject.fromRawJson(String str) =>
      PrizeObject.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PrizeObject.fromJson(Map<String, dynamic> json) => PrizeObject(
    id: json["id"],
    code: json["code"],
    title: json["title"],
    qty: json["qty"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "title": title,
    "qty": qty,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
