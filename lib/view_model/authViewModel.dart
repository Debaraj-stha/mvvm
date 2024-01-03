import 'package:flutter/material.dart';
import 'package:mvvm/repository/authRepository.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewNodel {
  final _authRepo = AuthRepository();
  Future<void> login(dynamic data, BuildContext context) async {
    _authRepo.loginApi(data).then((value) {
      Utils.showSnackBar(context, value.toString(), bgColor: Colors.green);
    }).onError((error, stackTrace) {
      Utils.showSnackBar(
        context,
        error.toString(),
      );
    });
  }
}
