import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:steam_pal/domain/models/login/login_model.dart';
import 'package:steam_pal/view_model/login/login_view_model.dart';

import '../../domain/models/login/login_result_model.dart';
import '../../domain/services/login.dart';
import '../../pages/home/home.dart';

class LoginViewModelImpl implements LoginViewModel {
  @override
  Future<bool> checkToken(BuildContext context) async {
    //a function to check if the user already login before
    var secure = const FlutterSecureStorage();
    var token = await secure.read(key: 'TOKEN');
    if (token != null) {
      //context.read(bearerToken).state = token;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return const HomePage();
        }),
      );
      return true;
    }
    return false;
  }

  @override
  Future<LoginResultModel> processLogin(
      BuildContext context, LoginModel loginModel) async {
    var result = await login(loginModel);

    return result;
  }

  @override
  Future<void> setToken(BuildContext context, String token) async {
    //set token to be used for user authentication
    var secure = const FlutterSecureStorage();
    await secure.write(key: 'TOKEN', value: token);
    //context.read(bearerToken).state = token;
  }

  @override
  void changeLoading(BuildContext context) {
    //.read(isLoading).state =  !context.read(isLoading).state;
  }
}
