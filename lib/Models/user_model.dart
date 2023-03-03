import 'dart:convert';



class UserModel {
  String? userName;
  String? emailId;
  String? password;

  UserModel({
    this.userName,
    this.emailId,
    this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userName = json['username'];
    emailId = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = userName;
    data['email'] = emailId;
    data['password'] = password;
    return data;
  }
}

class UserResponseModel {
  late int code;
  late String message;

  UserResponseModel(code, message);

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['code'] = code;
    data['message'] = message;

    return data;
  }
}

UserResponseModel userResponseFromJson(str) =>
    UserResponseModel.fromJson(json.decode(str));
