import 'dart:convert';

class ChangeStatusStoreResponseModel {
  final bool? success;
  final String? message;
  final Data? data;

  ChangeStatusStoreResponseModel({this.success, this.message, this.data});

  factory ChangeStatusStoreResponseModel.fromRawJson(String str) =>
      ChangeStatusStoreResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChangeStatusStoreResponseModel.fromJson(Map<String, dynamic> json) =>
      ChangeStatusStoreResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final int? id;
  final String? name;
  final String? location;
  final String? status;
  final String? phone;
  final List<int>? prizes;
  final bool? received;
  final DateTime? receivedDate;
  final String? failedReason;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Data({
    this.id,
    this.name,
    this.location,
    this.status,
    this.phone,
    this.prizes,
    this.received,
    this.receivedDate,
    this.failedReason,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    location: json["location"],
    status: json["status"],
    phone: json["phone"],
    prizes: json["prizes"] == null
        ? []
        : List<int>.from(json["prizes"]!.map((x) => x)),
    received: json["received"],
    receivedDate: json["received_date"] == null
        ? null
        : DateTime.parse(json["received_date"]),
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
    "name": name,
    "location": location,
    "status": status,
    "phone": phone,
    "prizes": prizes == null ? [] : List<dynamic>.from(prizes!.map((x) => x)),
    "received": received,
    "received_date": receivedDate?.toIso8601String(),
    "failed_reason": failedReason,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
