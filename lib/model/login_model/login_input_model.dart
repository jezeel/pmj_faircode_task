// To parse this JSON data, do
//
//     final loginInputModel = loginInputModelFromJson(jsonString);

import 'dart:convert';

class LoginInputModel {
  LoginInputModel({
    this.username,
    this.password,
  });

  String? username;
  String? password;

  factory LoginInputModel.fromRawJson(String str) => LoginInputModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginInputModel.fromJson(Map<String, dynamic> json) => LoginInputModel(
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
  };
}
