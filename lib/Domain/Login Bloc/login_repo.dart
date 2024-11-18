import 'package:http/http.dart' as http;
import 'package:youapp/core.dart';

class UserRepository {
  Future<http.Response> login(String username, String password) async {
    var _body = json.encode({
      "email": username.contains('@') ? username.toString() : "",
      "username": username.contains('@') ? "" : username.toString(),
      "password": password,
    });
    print('Body Login :: $_body');
    var response = await http.post(Uri.parse(LOGIN),
        headers: {
          'Content-Type': "application/json",
        },
        body: json.encode({
          "email": username.contains('@') ? username.toString() : "",
          "username": username.contains('@') ? "" : username.toString(),
          "password": password,
        }));
    print('S.CODE LOGIN :: ${response.statusCode}');
    print('S.BODY LOGIN :: ${response.body}');
    return response;
  }
}
