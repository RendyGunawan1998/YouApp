import 'package:http/http.dart' as http;
import 'package:youapp/core.dart';

class RegisRepository {
  Future<http.Response> regis(
      String email, String username, String password) async {
    var _body = json.encode({
      "email": email.toString(),
      "username": username.toString(),
      "password": password.toString(),
    });
    print('BODY REGIS :: $_body');
    var response = await http.post(Uri.parse(REGISTER),
        headers: {
          'Content-Type': "application/json",
        },
        body: json.encode({
          "email": email.toString(),
          "username": username.toString(),
          "password": password.toString(),
        }));
    print('S.CODE REGIS :: ${response.statusCode}');
    print('S.BODY REGIS :: ${response.body}');
    return response;
  }
}
