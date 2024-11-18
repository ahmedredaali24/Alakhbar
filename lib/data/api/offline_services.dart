import 'dart:convert';

import 'package:alakhbar/data/model/top_headline_response_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class OfflineServices {
  static saveTopHead(dtoObject, String key) async {
  var  prefs = await SharedPreferences.getInstance();

    try {
      String jsonString = jsonEncode(dtoObject?.toJson());
      await prefs.setString(key, jsonString);
    } catch (e) {
      print("Error Saving Data by SharedPreferences: $e");
    }
  }

  static Future<T?> getFromPrefs<T>({
    required String key,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
   var prefs = await SharedPreferences.getInstance();

    try {
      String? jsonString = await prefs.getString(key);
      if (jsonString != null) {
        return fromJson(jsonDecode(jsonString));
      }
    } catch (e) {
      print("Error reading from SharedPreferences: $e");
    }
    return null;
  }
// static getTopHead() async {
//   String? jsonString = await prefs?.getString("key");
//   if (jsonString != null) {
//     TopHeadLineResponseDto.fromJson(jsonDecode(jsonString));
//   }
//   null;
// }
}
