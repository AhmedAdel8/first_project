import 'package:first_project/core/cache_helper/cache_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //دالة getData تسترجع قيمة من sharedPreferences باستخدام المفتاح المحدد
  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

  //دالة isEnglish تتحقق مما إذا كانت اللغة الحالية هي الإنجليزية
  static bool isEnglish() => getCurrentLanguage() == "en";
  //دالة changeLanguageToEn تقوم بتغيير اللغة إلى الإنجليزية
  static Future<void> changeLanguageToEn() async {
    await CacheHelper.saveData(key: CacheKeys.currentLanguage, value: "en");
  }

  //الحصول على اللغة الحالية
  static String getCurrentLanguage() {
    // "en" دالة getCurrentLanguage تسترجع اللغة الحالية، وإذا لم تكن موجودة، تعيد القيمة الافتراضية
    return CacheHelper.getData(
          key: CacheKeys.currentLanguage,
        ) ??
        "en";
  }

  //دالة changeLanguageToAr تقوم بتغيير اللغة إلى العربية
  static Future<void> changeLanguageToAr() async {
    await CacheHelper.saveData(key: CacheKeys.currentLanguage, value: "ar");
  }

  //حفظ البيانات
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);

    return await sharedPreferences.setDouble(key, value);
  }

  //إزالة البيانات
  static Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }

  //مسح جميع البيانات
  static Future<bool> clearAllData() async {
    return await sharedPreferences.clear();
  }

  //دالة saveSecuredString تُستخدم لتخزين البيانات بشكل آمن باستخدام
  //FlutterSecureStorage.

  static Future saveSecuredString({
    required String key,
    required dynamic value,
  }) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint(
        "FlutterSecureStorage : setSecuredString with key : $key and value : $value");
    await flutterSecureStorage.write(key: key, value: value.toString());
  }

  //دالة getSecuredString تُستخدم لاسترجاع البيانات المخزنة بشكل آمن
  static Future getSecuredString({
    required String key,
  }) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint('FlutterSecureStorage : getSecuredString with key :');
    try {
      return await flutterSecureStorage.read(key: key);
    } catch (e) {
      return null;
    }
  }
  //دالة clearAllSecuredData تُزيل جميع البيانات المخزنة بشكل آمن.
  static Future clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage : all data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }
}
