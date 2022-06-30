import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static const String KEY_BOOKMARKS = 'bookmarks';

  static PreferenceUtils instance = PreferenceUtils._internal();
  factory PreferenceUtils() => instance;

  PreferenceUtils._internal();
  late SharedPreferences _prefs;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get bookmarks {
    return _prefs.getString(KEY_BOOKMARKS) ?? "";
  }

  set bookmarks(String value) {
    _prefs.setString(KEY_BOOKMARKS, value);
  }
}
