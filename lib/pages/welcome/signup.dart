import 'package:flutter/material.dart';
import 'package:steam_pal/pages/home/home.dart';
import 'package:steam_pal/pages/welcome/login.dart';
import 'package:steam_pal/widgets/buttons/button_round_gradient.dart';

import '../../domain/models/login/login_model.dart';
import '../../view_model/signup/signup_view_model_impl.dart';
import '../../widgets/text/text_gradient.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accountController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final mainViewModel = SignUpViewModelImpl();
    final scaffoldkey = GlobalKey<ScaffoldState>();

    bool _validateInput(passwordController) {
      if (passwordController.text != confirmPasswordController.text) {
        print(passwordController.text);
        print(confirmPasswordController.text);
        return false;
      } else {
        return true;
      }
    }

    ;
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: RadialGradient(
              center: Alignment.topRight,
              radius: 2,
              colors: [Color(0xff682757), Color(0xff21222D)])),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextGradient(
              "Sign Up",
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
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                child: TextField(
                  controller: accountController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Colors.grey)),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                child: TextField(
                  controller: passwordController,
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.grey)),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                child: TextField(
                  controller: confirmPasswordController,
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      labelText: 'Confirm Password',
                      labelStyle: const TextStyle(color: Colors.grey)),
                ),
              ),
            ),
            ButtonRoundGradient(
              text: "Sign Up",
              onPressed: () async {
                var result = await mainViewModel.processRegister(
                    context,
                    new LoginModel(
                        accountController.text, passwordController.text));

                print(result.statusCode);
                if (result.statusCode == 200) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomePage(),
                    ),
                    (route) => false,
                  );
                } else {
                  final snack = SnackBar(
                    content: Text(result.message),
                    duration: Duration(seconds: 1),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snack);
                }
              },
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage(),
                    ),
                    (route) => false,
                  );
                },
                child: Text("Already a member? Login!"))
          ],
        ),
      ),
    ));
  }
}
