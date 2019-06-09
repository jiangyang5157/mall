import 'package:flutter/material.dart';

class SignUpModel extends ChangeNotifier {
  @override
  void dispose() {
    super.dispose();
    print('#### SignUpModel - dispose');
  }

  String _username;

  String get username => _username;

  set username(String username) {
    _username = username;
    notifyListeners();
  }

  String _password;

  String get password => _password;

  set password(String password) {
    _password = password;
    notifyListeners();
  }

  String _emailAddress;

  String get emailAddress => _emailAddress;

  set emailAddress(String emailAddress) {
    _emailAddress = emailAddress;
    notifyListeners();
  }

  SignUpModel() {
    print('#### SignUpModel()');
    _init();
  }

  void _init() {
    username = '';
    password = '';
    emailAddress = '';
  }
}