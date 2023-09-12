import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rakshak_sos/repository/auth_repository.dart';

import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class AuthViewModel extends ChangeNotifier {
  final myAuth = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    myAuth.loginApi(data).then((value) {
      setLoading(false);
      Utils.toastMessage("Login Successful");
      Navigator.pushNamed(context, RoutesName.user_home);
      if (kDebugMode) {
        log(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(error.toString());
      if (kDebugMode) {
        log(error.toString());
      }
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setLoading(true);
    myAuth.signUpApi(data).then((value) {
      setLoading(false);
      Utils.toastMessage("Successful Registered");
      Navigator.pushNamed(context, RoutesName.user_home);
      if (kDebugMode) {
        log(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(error.toString());
      if (kDebugMode) {
        log(error.toString());
      }
    });
  }
}
