import 'dart:convert';
import 'package:appflut/Models/user_model.dart';
import 'package:http/http.dart' as http;

class APIServices {
  static String apiURL = "http://10.0.2.2/testapp/wordpress";

  static Future<UserResponseModel> registerUser(UserModel model) async {
    var response = await http.post(
      Uri.parse("$apiURL/wp-json/wp/v2/users/register"),
      headers: {
        'Content-type': 'application/json',
      },
      body: jsonEncode(model.toJson()),
      /*{
    "username":"smokyhead",
    "email":"smokyhead@gmail.com",
    "password":"hello123"
    }*/
    );
    return userResponseFromJson(response.body);
  }
}
