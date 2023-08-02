import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:solardino/app/modules/splash/splash_store.dart';
import 'package:solardino/app/shared/responsive/constants.dart';

import '../onboarding_introducao/onboardingIntroducao_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashStore loginStore;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool showPassword = true;
  late Widget path;

  late ReactionDisposer reactionDisposer;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    reactionDisposer();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    loginStore = Provider.of<SplashStore>(context);

    reactionDisposer = autorun((_) async {
      loginStore.isFirstAcess().then((isFirst) {
        if (isFirst) {
          Modular.to.pushNamed('/onboarding');
        }
        loginStore.isLogged().then((value) {
          if (!value) {
            Future.delayed(const Duration(seconds: 5));
            Modular.to.pushNamed('/onboarding');
          } else {
            //  Modular.to.pushNamed('/login');
          }
          //
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/app/shared/assets/images/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Center(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Constants.corPrimaria,
                            borderRadius:
                                BorderRadius.all(Radius.circular(400))),
                        width: 222,
                        height: 222,
                        child: CircularProgressIndicator(
                          color: Constants.corPrimaria,
                          backgroundColor: Constants.corSecundaria,
                          strokeWidth: 0.5,
                        ))),
                InkWell(
                  onTap: () {
                    var itens = "2:1:1000.0/1:1:1000.0";
                    var explode_itens = itens.split("/");
                    List listaDeItensParaBuscar = [];
                    var idDoItem;
                    var qtdDoItem;
                    var valorDoItem;
                    for (var i = 0; i <= explode_itens.length - 1; i++) {
                      var explode_sub_itens = explode_itens[i].split(":");
                      for (var x = 0; x <= explode_sub_itens.length - 1; x++) {
                        idDoItem = explode_sub_itens[0];
                        qtdDoItem = explode_sub_itens[1];
                        valorDoItem = explode_sub_itens[2];
                      }
                      listaDeItensParaBuscar.add(idDoItem);
                    }
                    print(listaDeItensParaBuscar.toString());
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 90, left: 12),
                    child: Center(
                      child: SvgPicture.asset(
                        'lib/app/shared/assets/images/logodino.svg',
                        height: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
