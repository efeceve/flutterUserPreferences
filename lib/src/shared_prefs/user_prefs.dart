import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  static final UserPrefs _instance = new UserPrefs._internal();
  factory UserPrefs() {
    return _instance;
  }

  UserPrefs._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //Gender GET and SET:
  int get gender {
    return _prefs.getInt('gender') ?? 1;
  }

  set gender(int? value) {
    _prefs.setInt('gender', value as int);
  }

  //Secondary Color GET and SET:
  bool get secondaryColor {
    return _prefs.getBool('secondaryColor') ?? false;
  }

  set secondaryColor(bool value) {
    _prefs.setBool('secondaryColor', value);
  }

  //User name GET and SET:
  String get userName {
    return _prefs.getString('userName') ?? '';
  }

  set userName(String value) {
    _prefs.setString('userName', value);
  }

  //Last page GET and SET:
  String get lastPage {
    return _prefs.getString('lastPage') ?? 'home';
  }

  set lastPage(String value) {
    _prefs.setString('lastPage', value);
  }
}
