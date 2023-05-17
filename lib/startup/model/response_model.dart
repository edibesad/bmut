import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  String? message;
  String? type;
  String? email;
  String? password;

  ResponseModel({this.message, this.type, this.email, this.password});

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
      message: json["message"], type: json["type"], email: json["email"]);

  Map<String, dynamic> toJson() =>
      {"message": message, "type": type, "email": email, "password": password};
}
