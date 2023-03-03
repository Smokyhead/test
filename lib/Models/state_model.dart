import 'package:flutter/material.dart';

class MyModel extends ChangeNotifier {
  String _username = "";
  String _firstName = "";
  String _lastName = "";
  String _email = "";
  String _password = "";
  int _id = 0;
  String _token = "";

  String get username => _username;
  String get email => _email;
  String get password => _password;
  String get firstName => _firstName;
  String get lastName => _lastName;
  int get id => _id;
  String get token => _token;

  set username(String value) {
    _username = value;
    notifyListeners();
  }
  set email(String value) {
    _email = value;
    notifyListeners();
  }
  set password(String value) {
    _password = value;
    notifyListeners();
  }
  set firstName(String value) {
    _firstName = value;
    notifyListeners();
  }
  set lastName(String value) {
    _lastName = value;
    notifyListeners();
  }
  set id(int value) {
    _id = value;
    notifyListeners();
  }
  set token(String value) {
    _token = value;
    notifyListeners();
  }
}