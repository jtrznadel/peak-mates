import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:peak_mates/features/auth/data/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  void initUser(UserModel? user) {
    if (_user != user) {
      _user = user;
    }
  }

  set user(UserModel? user) {
    if (_user != user) {
      _user = user;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }
}
