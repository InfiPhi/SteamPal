import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:steam_pal/domain/services/steam_login.dart';
import 'package:steam_pal/view_model/steam_login/steam_login_view_model_impl.dart';

import '../../widgets/buttons/button_round_gradient.dart';
import '../../widgets/text/text_gradient.dart';

class SteamLogin extends ConsumerWidget {
  final apiKey = " 0AA9DE3A98B10EA5E2028A859D001CBC";
  final accountController = TextEditingController();
  final passwordController = TextEditingController();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  final steamViewModel = SteamLoginViewModelImp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        key: scaffoldkey,
        body: FutureBuilder(
            future: steamViewModel.steamLogin(context),
            builder: (context, snapshot) {
              // if (snapshot.connectionState == ConnectionState.waiting)
              //   return Center(
              //     child: CircularProgressIndicator(),
              //   );
              return Center(
                child: Container(
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
                            "Connect Steam Account",
                            gradient: LinearGradient(colors: [
                              Color(0xff37C4B7),
                              Color(0xffB9C44E),
                            ]),
                            style: TextStyle(
                              fontSize: 28,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ButtonRoundGradient(
                            text: "Get Started",
                            onPressed: () async {
                              steamLogin();
                              ScaffoldMessenger.of(scaffoldkey.currentContext!)
                                  .showSnackBar(SnackBar(
                                      content: Text(steamLogin().toString())));
                            },
                          ),
                        ],
                      ),
                    )),
              );
            }));
  }
}
