import 'package:flutter/cupertino.dart';
import 'package:steam_pal/domain/models/login/login_model.dart';

import '../../domain/models/login/login_result_model.dart';

abstract class LoginViewModel {
  //interface for the mainview model
  Future<LoginResultModel> processLogin(
      BuildContext context, LoginModel loginModel);

  void changeLoading(BuildContext context);

  Future<void> setToken(BuildContext context, String token);

  Future<bool> checkToken(BuildContext context);
}
