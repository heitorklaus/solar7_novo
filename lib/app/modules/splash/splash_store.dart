import 'package:mobx/mobx.dart';
part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  @observable
  bool loading = false;

  @observable
  bool isLoggedIn = false;

  @action
  Future login() async {
    loading = true;
    Future.delayed(const Duration(seconds: 5));

    loading = false;
    isLoggedIn = true;
    Future.delayed(const Duration(seconds: 5));

    return isLoggedIn;
  }

  Future isFirstAcess() async {
    try {
      var first = true;
      return first;
    } catch (e) {}
  }

  Future isLogged() async {
    try {
      isLoggedIn = false;
      return isLoggedIn;
    } catch (e) {}
  }
}
