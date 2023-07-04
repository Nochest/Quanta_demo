import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:quanta_demo_app/main.dart';
import 'package:quanta_demo_app/services/demo_service.dart';

class DemoProvider extends ChangeNotifier {
  Session? _currentSession;
  Session? get currentSession => _currentSession;
  set currentSession(Session? value) {
    _currentSession = value;
    notifyListeners();
  }

  User? _currentAccount;
  User? get currentAccount => _currentAccount;
  set currentAccount(User? value) {
    _currentAccount = value;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    await DemoService().emailSession(email, password).then((value) async {
      if (value != null) {
        _currentSession = value;
        localStorage.setString('user', _currentSession.toString());
        localStorage.setString('email', email);
        await DemoService().getAccount().then((value) {
          if (value != null) {
            _currentAccount = value;
            notifyListeners();
          }
        });
      }
    });
  }
}
