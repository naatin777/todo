import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesInstance {
  static late final SharedPreferences _prefs;
  SharedPreferences get prefs => _prefs;

  static initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
