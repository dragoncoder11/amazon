import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheNetwork {
  static late SharedPreferences sharedPref;
  static Future cacheInitialization() async {
    sharedPref = await SharedPreferences.getInstance();
  }

  static Future <bool>insertToCache({
    required String key,
    required String value,
  }) async {
    return await sharedPref.setString(key, value);
  }

  static Future getCacheData({
    required String key,
  }) async {
    return  sharedPref.get(
      key,
    )??'';
  }

  static Future<bool> removeCacheItem({
    required String key,
  }) async {
    return await sharedPref.remove(
      key,
    );
  }
}
