import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:panahan_app/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'user_services.dart';

part 'province_service.dart';

part 'city_service.dart';

part 'archer_services.dart';

part 'jadwal_services.dart';

part 'venue_services.dart';

part 'pertandingan_services.dart';

String baseURL = 'http://api.panahan.alengkongbalicamp.com/api/';
String locationBaseUrl = 'https://dev.farizdotid.com/api/daerahindonesia/';

Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");
  return token;
}

Future<void> setPref(bool status, String? token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool("isLogin", status);
  prefs.setString("token", token!);
}

void setLocalUser(UserModel user) async {
  await Hive.openBox('userBox');
  var userBox = Hive.box('userBox');
  userBox.add(user);
}
