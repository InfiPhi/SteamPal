import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:steam_pal/pages/welcome/signup.dart';

import '../../domain/models/login/login_model.dart';
import '../../view_model/login/login_vie_model_imp.dart';
import '../../widgets/buttons/button_round_gradient.dart';
import '../../widgets/text/text_gradient.dart';
import '../home/home.dart';

class SteamLogin extends ConsumerWidget {
  final accountController = TextEditingController();
  final passwordController = TextEditingController();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  final mainViewModel = LoginViewModelImpl();
  final _password = "";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        key: scaffoldkey,
        body: FutureBuilder(
            future: mainViewModel.checkToken(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else {
                var result = snapshot.data as bool;
                if (result)
                  return Container();
                else {
                  return Center(
                    child: Container(
                        decoration: const BoxDecoration(
                            gradient: RadialGradient(
                                center: Alignment.topRight,
                                radius: 2,
                                colors: [
                              Color(0xff682757),
                              Color(0xff21222D)
                            ])),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TextGradient(
                                "Connect your Steam Account",
                                gradient: LinearGradient(colors: [
                                  Color(0xff37C4B7),
                                  Color(0xffB9C44E),
                                ]),
                                style: TextStyle(
                                  fontSize: 36,
                                ),
                              ),
                              SizedBox(
                                width: 300,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 0),
                                  child: TextField(
                                    controller: accountController,
                                    keyboardType: TextInputType.emailAddress,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.blue, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        labelText: 'Email',
                                        labelStyle: const TextStyle(
                                            color: Colors.grey)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 300,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 0),
                                  child: TextField(
                                    controller: passwordController,
                                    style: TextStyle(color: Colors.white),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        border: const OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.blue, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        labelText: 'Password',
                                        labelStyle: const TextStyle(
                                            color: Colors.grey)),
                                  ),
                                ),
                              ),
                              ButtonRoundGradient(
                                text: "Login",
                                onPressed: () async {
                                  var result = await mainViewModel.processLogin(
                                      context,
                                      new LoginModel(accountController.text,
                                          passwordController.text));

                                  print("lohjgbkhj");
                                  if (result.statusCode == 200) {
                                    await mainViewModel.setToken(
                                        context, result.message);
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HomePage(),
                                      ),
                                      (route) => false,
                                    );
                                  } else {
                                    ScaffoldMessenger.of(
                                            scaffoldkey.currentContext!)
                                        .showSnackBar(SnackBar(
                                            content: Text(result.message)));
                                  }
                                },
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SignupPage(),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  child: Text("Don't have account? Sign up!")),
                            ],
                          ),
                        )),
                  );
                }
              }
            }));
  }
}
