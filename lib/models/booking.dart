import 'dart:convert';

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

class Booking {
  bool success;
  String message;
  BookingData data;

  Booking({
    required this.success,
    required this.message,
    required this.data,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        success: json["success"],
        message: json["message"],
        data: BookingData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class BookingData {
  int userId;
  int fieldId;
  String bookingStart;
  String bookingEnd;
  String date;
  String cost;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  BookingData({
    required this.userId,
    required this.fieldId,
    required this.bookingStart,
    required this.bookingEnd,
    required this.date,
    required this.cost,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) => BookingData(
        userId: json["user_id"],
        fieldId: json["field_id"],
        bookingStart: json["booking_start"],
        bookingEnd: json["booking_end"],
        date: json["date"],
        cost: json["cost"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "field_id": fieldId,
        "booking_start": bookingStart,
        "booking_end": bookingEnd,
        "date": date,
        "cost": cost,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
