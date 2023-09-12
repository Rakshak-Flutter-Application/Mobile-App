// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:rakshak_sos/utils/routes/routes_name.dart';
import 'package:rakshak_sos/utils/utils.dart';
import 'package:rakshak_sos/view_model/user_view_model.dart';
import '../../model/user_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) {
    getUserData().then((value) async {
      log(value.token.toString());
      if (value.token == 'null' || value.token == '') {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.user_login);
      } else {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.user_home);
      }
    }).onError((error, stackTrace) {
      Utils.flushbarErrorMessage(error.toString(), context);
    });
  }
}
