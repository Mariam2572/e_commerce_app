import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }  
  static Future <bool> setData(String key , dynamic value) {
    if(value is String) {
    return  sharedPreferences.setString(key, value);
    }
    if(value is int) {
   return   sharedPreferences.setInt(key, value);
    }
    if(value is double) {
    return  sharedPreferences.setDouble(key, value);
    }
    if(value is List<String>) {
     return sharedPreferences.setStringList(key, value);
    }else  {
    return  sharedPreferences.setBool(key, value);
    }
  }
  static Object? getData({required String key}){
   return sharedPreferences.get(key);
  }
  static Future<bool> removeData({required String key}){
    return sharedPreferences.remove(key);/// for logout or remove token before new login
  }
}