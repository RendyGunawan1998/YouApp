import 'package:http/http.dart' as http;
import 'package:youapp/core.dart';

class ProfileRepository {
  Future<DataProfile> createProfile(
      {String? name, String? birthday, int? height, int? weight}) async {
    var token = await getToken();
    var response = await http.post(Uri.parse(CREATE_PROFILE),
        headers: {
          'Content-Type': "application/json",
          'x-access-token': token,
        },
        body: json.encode({
          "name": name.toString(),
          "birthday": birthday.toString(),
          "height": height,
          "weight": weight,
          "interests": [""]
        }));
    print('S.CODE CREATE PROFILE :: ${response.statusCode}');
    if (response.statusCode == 201) {
      return DataProfile.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to create profile');
    }
  }

  Future<DataProfile> updateProfile(
      {String? name,
      String? birthday,
      int? height,
      int? weight,
      List<String>? interest}) async {
    var token = await getToken();
    var response = await http.put(Uri.parse(UPDATE_PROFILE),
        headers: {
          'Content-Type': "application/json",
          'x-access-token': token,
        },
        body: json.encode({
          "name": name.toString(),
          "birthday": birthday.toString(),
          "height": height,
          "weight": weight,
          "interests": interest,
        }));
    print('S.CODE UPDATE PROFILE :: ${response.statusCode}');
    if (response.statusCode == 200) {
      return DataProfile.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to update profile');
    }
  }

  Future<DataProfile> getProfile() async {
    var token = await getToken();
    print('TOKEN PROFILE :: $token');
    var response = await http.get(
      Uri.parse(PROFILE),
      headers: {
        'Content-Type': "application/json",
        'x-access-token': token,
      },
    );
    print('S.CODE GET PROFILE :: ${response.statusCode}');
    print('S.BODY GET PROFILE :: ${response.body}');
    if (response.statusCode == 200) {
      return DataProfile.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to get profile');
    }
  }
}
