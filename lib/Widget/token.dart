import '../core.dart';

Future<String> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token') ?? '';
  return token;
}
