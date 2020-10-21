import 'dart:convert';

import 'package:nad_app/models/doctor.dart';
import 'package:shared_preferences/shared_preferences.dart';

const TOKEN_PREFERENCE = "TOKEN_PREFERENCE";
const MY_DOCTORS_PREFERENCE = "MY_DOCTORS_PREFERENCE";
const LAST_SERVER_EDIT_PREFERENCE = "LAST_SERVER_EDIT_PREFERENCE";

Future<int> getLastServerEdit() async {
  var instance = await SharedPreferences.getInstance();
  int lastServerEdit = 0;
  if (instance.containsKey(LAST_SERVER_EDIT_PREFERENCE)) {
    lastServerEdit = instance.getInt(LAST_SERVER_EDIT_PREFERENCE);
  }
  return lastServerEdit;
}

Future<void> setLastServerEdit(int lastServerEdit) async {
  var instance = await SharedPreferences.getInstance();
  instance.setInt(LAST_SERVER_EDIT_PREFERENCE, lastServerEdit);
}

Future<List<Doctor>> getDoctors() async {
  var instance = await SharedPreferences.getInstance();
  List<Doctor> doctors = new List();
  if (instance.containsKey(MY_DOCTORS_PREFERENCE)) {
    try {
      String encodedDoctors = instance.getString(MY_DOCTORS_PREFERENCE);
      List<dynamic> jsonDoctors = jsonDecode(encodedDoctors);
      doctors.addAll(jsonDoctors.map((doctor) => Doctor.fromMap(doctor)).toList());
    } catch (err) {
      print("getDoctors error $err");
    }
  }
  return doctors;
}

Future<void> setDoctors(List<Doctor> doctors) async {
  var instance = await SharedPreferences.getInstance();
  var encodedDoctors = jsonEncode(doctors.map((doctor) => doctor.toJson()).toList());
  instance.setString(MY_DOCTORS_PREFERENCE, encodedDoctors);
}

Future<void> setToken(String sessionToken) async {
  var instance = await SharedPreferences.getInstance();
  instance.setString(TOKEN_PREFERENCE, sessionToken);
}

Future<String> getToken() async {
  var instance = await SharedPreferences.getInstance();
  return instance.getString(TOKEN_PREFERENCE);
}

Future<void> clearPreferences() async {
  var instance = await SharedPreferences.getInstance();
  instance.clear();
}