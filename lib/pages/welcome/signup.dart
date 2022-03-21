import 'package:flutter/material.dart';
import 'package:steam_pal/pages/welcome/login.dart';
import 'package:steam_pal/widgets/buttons/button_round_gradient.dart';

import '../../widgets/text/text_gradient.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment.topRight,
                  radius: 2,
                  colors: [Color(0xff682757), Color(0xff21222D)]
              )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const GradientText(
                  "Sign Up",
                  gradient: LinearGradient(colors: [Color(0xff37C4B7), Color(0xffB9C44E),]),
                  style: TextStyle(fontSize: 36,),
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          labelText: 'Email',
                          labelStyle: const TextStyle(color: Colors.grey)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.grey)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          labelText: 'Confirm Password',
                          labelStyle: const TextStyle(color: Colors.grey)
                      ),
                    ),
                  ),
                ),
                ButtonRoundGradient(
                  text: "Sign Up",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const LoginPage();
                      }),
                    );
                  },
                ),
              ],
            ),
          )
      ),
    );
  }
}