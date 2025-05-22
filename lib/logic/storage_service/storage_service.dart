import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static SharedPreferences? storage;

  static Future<void> initService() async {
    storage = await SharedPreferences.getInstance();
  }

  static void setValueStr(String key, String value) {
    if (storage != null) {
      storage!.setString(key, value);
    }
  }

  static String? getValueStr(String key) {
    if (storage != null) {
      return storage!.getString(key);
    }
    return null;
  }
}
