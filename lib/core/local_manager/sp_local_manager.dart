import 'package:shared_preferences/shared_preferences.dart';

class SPLocalManager {
  SPLocalManager._();
  static SPLocalManager? _instance;
  static SPLocalManager get instance {
    _instance ??= SPLocalManager._();
    return _instance!;
  }

  late SharedPreferences _sharedPreferences;
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  int? getInt(String key) => _sharedPreferences.getInt(key);
  Future<bool> setInt(String key, int value) => _sharedPreferences.setInt(key, value);
}
