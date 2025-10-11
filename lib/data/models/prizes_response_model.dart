import 'dart:convert';

class PrizesResponseModel {
  final bool? success;
  final String? message;
  final List<Prizes>? data;

  PrizesResponseModel({this.success, this.message, this.data});

  factory PrizesResponseModel.fromRawJson(String str) =>
      PrizesResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PrizesResponseModel.fromJson(Map<String, dynamic> json) =>
      PrizesResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Prizes>.from(json["data"]!.map((x) => Prizes.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Prizes {
  final int? id;
  final String? code;
  final String? title;
  final int? qty;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Prizes({
    this.id,
    this.code,
    this.title,
    this.qty,
    this.createdAt,
    this.updatedAt,
  });

  factory Prizes.fromRawJson(String str) => Prizes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Prizes.fromJson(Map<String, dynamic> json) => Prizes(
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
