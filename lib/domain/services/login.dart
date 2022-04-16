import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:steam_pal/domain/models/login/login_model.dart';

import '../models/login/login_result_model.dart';

Future<LoginResultModel> login(LoginModel login) async {
  //Api path
  //for ios:127.0.0.1
  const mainAPI = 'http://10.0.2.2:5000';
  const loginAPI = '/api/login';
  var url = Uri.parse('$mainAPI$loginAPI');
  dynamic data = {"Email": login.email, "Password": login.password};
  var response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
    },
    body: json.encode(data),
  );
  if (response.statusCode == 200) {
    return LoginResultModel(response.statusCode, response.body.toString());
  } else {
    return LoginResultModel(response.statusCode, "Invalid login");
  }
}
