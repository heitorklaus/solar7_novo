import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:solardino/app/modules/login/entities/auth.dart';
import 'package:solardino/app/modules/login/service/login_service.dart';

part 'login_store.g.dart';

@Injectable()
class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  //dynamic interface;

  @observable
  String? isLogin;

  @observable
  bool? isFormValid = false;

  @observable
  bool loading = false;

  @observable
  bool isLoggedIn = true;

  @observable
  ObservableFuture? returnLogin;

  final search = TextEditingController();

  @action
  doLogin(user, pass) {
    returnLogin =
        LoginService().doLogin(user, pass).asObservable().then((Auth value) {
      if (value.accessToken != null) {
        Modular.to.pushNamed('/home');
      }
    });
  }
}
