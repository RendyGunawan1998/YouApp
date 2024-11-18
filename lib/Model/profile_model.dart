// ignore_for_file: unnecessary_null_in_if_null_operators

import '../core.dart';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String message;
  DataProfile data;

  ProfileModel({
    required this.message,
    required this.data,
  });

  ProfileModel copyWith({
    String? message,
    DataProfile? data,
  }) =>
      ProfileModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        message: json["message"],
        data: DataProfile.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class DataProfile {
  String email;
  String username;
  String? name;
  String? birthday;
  String? horoscope;
  String? zodiac;
  int? height;
  int? weight;
  List<String> interests;

  DataProfile({
    required this.email,
    required this.username,
    this.name,
    this.birthday,
    this.horoscope,
    this.zodiac,
    this.height,
    this.weight,
    required this.interests,
  });

  DataProfile copyWith({
    String? email,
    String? username,
    String? name,
    String? birthday,
    String? horoscope,
    String? zodiac,
    int? height,
    int? weight,
    List<String>? interests,
  }) =>
      DataProfile(
        email: email ?? this.email,
        username: username ?? this.username,
        name: name ?? this.name,
        birthday: birthday ?? this.birthday,
        horoscope: horoscope ?? this.horoscope,
        zodiac: zodiac ?? this.zodiac,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        interests: interests ?? this.interests,
      );

  factory DataProfile.fromJson(Map<String, dynamic> json) => DataProfile(
        email: json["email"],
        username: json["username"],
        name: json["name"] ?? null,
        birthday: json["birthday"] ?? null,
        horoscope: json["horoscope"] ?? null,
        zodiac: json["zodiac"] ?? null,
        height: json["height"] ?? null,
        weight: json["weight"] ?? null,
        interests: List<String>.from(json["interests"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "name": name,
        "birthday": birthday,
        "horoscope": horoscope,
        "zodiac": zodiac,
        "height": height,
        "weight": weight,
        "interests": List<dynamic>.from(interests.map((x) => x)),
      };
}
