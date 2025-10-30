import 'package:hms_mobile/main.dart';

import '../constants/shared_pref_keys.dart';

class TokenStorage {
  TokenStorage._();

  static final TokenStorage instance = TokenStorage._();

  void saveVisitorToken(String visitorToken) {
    sharedPreferences.setString(visitorToken, visitorToken);
  }

  String? getVisitorToken() {
    return sharedPreferences.getString(visitorToken);
  }
}
