import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:solardino/app/modules/home/view/home_page.dart';
import 'package:solardino/app/modules/login/store/login_store.dart';
import 'package:solardino/app/shared/responsive/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginStore loginStore;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool showPassword = true;

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

    loginStore = Provider.of<LoginStore>(context);
    reactionDisposer = reaction((_) => loginStore.isLoggedIn, (bool loggedIn) {
      if (loggedIn) {
        Modular.to.pushNamed('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.corPrimaria,
      body: SafeArea(
          top: true,
          bottom: true,
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 50),
            child: SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: SvgPicture.asset(
                      'lib/app/shared/assets/images/logodino.svg',
                      height: 40,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    height: 100,
                  ),
                  Column(
                    children: [
                      Text(
                        'Digite seus dados',
                        style: Constants.textCardTitle,
                      ),
                      Observer(builder: (_) {
                        return TextField(
                          enabled: !loginStore.loading,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          controller: _emailController,
                        );
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      Observer(builder: (_) {
                        return TextField(
                          enabled: !loginStore.loading,
                          keyboardType: TextInputType.visiblePassword,
                          autocorrect: false,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  child: const Icon(
                                      Icons.remove_red_eye_outlined)),
                              labelText: 'Senha',
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                        );
                      })
                    ],
                  ),
                  const Spacer(),
                  Observer(builder: (context) {
                    // print(loginStore.isLoggedIn);
                    return GestureDetector(
                      onTap: () {
                        loginStore.doLogin(
                            _emailController.text, _passwordController.text);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        child: loginStore.loading
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : const Text('Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                      ),
                    );
                  }),
                  const Spacer(),
                ],
              ),
            ),
          )),
    );
  }
}
