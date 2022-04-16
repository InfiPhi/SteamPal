import 'package:flutter/src/widgets/framework.dart';
import 'package:steam_pal/domain/models/login/login_model.dart';
import 'package:steam_pal/domain/models/login/login_result_model.dart';
import 'package:steam_pal/view_model/signup/signup_view_model.dart';

import '../../domain/services/signup.dart';

class SignUpViewModelImpl implements SignUpViewModel {
  @override
  Future<LoginResultModel> processRegister(
      BuildContext context, LoginModel loginModel) async {
    var result = await register(loginModel);
    return result;
  }
}
