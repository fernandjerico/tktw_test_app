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
  final String? custId;
  final String? name;
  final String? address;
  final String? status;
  final String? phone;
  final String? branchCode;
  final List<int>? prizes;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<CustomerTth>? customerTth;
  final List<PrizeObject>? prizeObjects;
  final String? tthNo;
  final String? salesId;
  final String? ttottpNo;
  final DateTime? docDate;
  final bool? received;
  final dynamic receivedDate;
  final dynamic failedReason;

  Customer({
    this.id,
    this.custId,
    this.name,
    this.address,
    this.status,
    this.phone,
    this.branchCode,
    this.prizes,
    this.createdAt,
    this.updatedAt,
    this.customerTth,
    this.prizeObjects,
    this.tthNo,
    this.salesId,
    this.ttottpNo,
    this.docDate,
    this.received,
    this.receivedDate,
    this.failedReason,
  });

  factory Customer.fromRawJson(String str) =>
      Customer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    custId: json["cust_id"],
    name: json["name"],
    address: json["address"],
    status: json["status"],
    phone: json["phone"],
    branchCode: json["branch_code"],
    prizes: json["prizes"] == null
        ? []
        : List<int>.from(json["prizes"]!.map((x) => x)),
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    customerTth: json["customer_tth"] == null
        ? []
        : List<CustomerTth>.from(
            json["customer_tth"]!.map((x) => CustomerTth.fromJson(x)),
          ),
    prizeObjects: json["prize_objects"] == null
        ? []
        : List<PrizeObject>.from(
            json["prize_objects"]!.map((x) => PrizeObject.fromJson(x)),
          ),
    tthNo: json["tth_no"],
    salesId: json["sales_id"],
    ttottpNo: json["ttottp_no"],
    docDate: json["doc_date"] == null ? null : DateTime.parse(json["doc_date"]),
    received: json["received"],
    receivedDate: json["received_date"],
    failedReason: json["failed_reason"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cust_id": custId,
    "name": name,
    "address": address,
    "status": status,
    "phone": phone,
    "branch_code": branchCode,
    "prizes": prizes == null ? [] : List<dynamic>.from(prizes!.map((x) => x)),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "customer_tth": customerTth == null
        ? []
        : List<dynamic>.from(customerTth!.map((x) => x.toJson())),
    "prize_objects": prizeObjects == null
        ? []
        : List<dynamic>.from(prizeObjects!.map((x) => x.toJson())),
    "tth_no": tthNo,
    "sales_id": salesId,
    "ttottp_no": ttottpNo,
    "doc_date": docDate?.toIso8601String(),
    "received": received,
    "received_date": receivedDate,
    "failed_reason": failedReason,
  };
}

class CustomerTth {
  final int? id;
  final String? tthNo;
  final String? salesId;
  final String? ttottpNo;
  final String? custId;
  final DateTime? docDate;
  final bool? received;
  final dynamic receivedDate;
  final dynamic failedReason;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CustomerTth({
    this.id,
    this.tthNo,
    this.salesId,
    this.ttottpNo,
    this.custId,
    this.docDate,
    this.received,
    this.receivedDate,
    this.failedReason,
    this.createdAt,
    this.updatedAt,
  });

  factory CustomerTth.fromRawJson(String str) =>
      CustomerTth.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerTth.fromJson(Map<String, dynamic> json) => CustomerTth(
    id: json["id"],
    tthNo: json["tth_no"],
    salesId: json["sales_id"],
    ttottpNo: json["ttottp_no"],
    custId: json["cust_id"],
    docDate: json["doc_date"] == null ? null : DateTime.parse(json["doc_date"]),
    received: json["received"],
    receivedDate: json["received_date"],
    failedReason: json["failed_reason"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tth_no": tthNo,
    "sales_id": salesId,
    "ttottp_no": ttottpNo,
    "cust_id": custId,
    "doc_date": docDate?.toIso8601String(),
    "received": received,
    "received_date": receivedDate,
    "failed_reason": failedReason,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
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
