import 'package:shared_preferences/shared_preferences.dart';

class Token {
  static final Token _token = Token._internal();
  static const _tokenKey = 'GETJOB_TOKEN_KEY';

  String? _tokenString;

  factory Token() {
    return _token;
  }

  Token._internal() {
    _readToken();
  }

  Future<void> _readToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _tokenString = prefs.getString(_tokenKey);
  }

  Future<void> storeToken(String t) async {
    _tokenString = t;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_tokenKey, t);
  }

  String getToken() {
    return _tokenString ?? '';
  }

  bool hasToken() {
    return _tokenString != null && _tokenString!.isNotEmpty;
  }
}