import 'package:shared_preferences/shared_preferences.dart';

class UsersPreference {

  static final UsersPreference _instance = new UsersPreference._internal();

  factory UsersPreference() {
    return _instance;
  }

  UsersPreference._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get token {
    return _prefs.getString('token') ?? '';
  }

  set token( String value ) {
    _prefs.setString('token', value);
  }
  
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'login';
  }

  set ultimaPagina( String value ) {
    _prefs.setString('ultimaPagina', value);
  }

  validToken( String token ) {
    return false;
  }
}

