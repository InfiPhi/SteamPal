import 'package:flutter/cupertino.dart';

import '../../domain/models/login/login_model.dart';
import '../../domain/models/login/login_result_model.dart';

abstract class SignUpViewModel {
  Future<LoginResultModel> processRegister(
      BuildContext context, LoginModel loginModel);
}
