import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? id;
  String? password;
  String? email;
  int? v;

  UserModel({
    this.id,
    this.password,
    this.email,
    this.v,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        password: json["password"],
        email: json["email"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "password": password,
        "email": email,
        "__v": v,
      };
}
