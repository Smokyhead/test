import 'package:appflut/Models/login_model.dart';
import 'package:appflut/Models/state_model.dart';
import 'package:http/http.dart' as http;

class LoginAPI {
  static late LoginResponseModel responseModel;
  static MyModel modelVal = MyModel();
  static var client = http.Client();
  static String apiURL = "http://10.0.2.2/testapp/wordpress";

  static Future<bool> loginUser(String email, String password) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };

    var response = await client.post(
        Uri.parse(
          "$apiURL/wp-json/jwt-auth/v1/token",
        ),
        headers: requestHeaders,
        body: {
          "email": email,
          "password": password,
        });

    if (response.statusCode == 200) {
      var jsonString = response.body;
      responseModel = loginRsponseFromJson(jsonString);
      modelVal.id = responseModel.data!.toJson()['id'];
      modelVal.username = responseModel.data!.toJson()['nicename'];

      return responseModel.statusCode == 200 ? true : false;
    }
    return false;
  }
}
