import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  bool _authenticated = false;

  bool get isAuthenticated => _authenticated;

  void signIn() {
    _authenticated = true;
    notifyListeners();
  }

  void signOut() {
    _authenticated = false;
    notifyListeners();
  }
}
