// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on LoginStoreBase, Store {
  late final _$isLoginAtom =
      Atom(name: 'LoginStoreBase.isLogin', context: context);

  @override
  String? get isLogin {
    _$isLoginAtom.reportRead();
    return super.isLogin;
  }

  @override
  set isLogin(String? value) {
    _$isLoginAtom.reportWrite(value, super.isLogin, () {
      super.isLogin = value;
    });
  }

  late final _$isFormValidAtom =
      Atom(name: 'LoginStoreBase.isFormValid', context: context);

  @override
  bool? get isFormValid {
    _$isFormValidAtom.reportRead();
    return super.isFormValid;
  }

  @override
  set isFormValid(bool? value) {
    _$isFormValidAtom.reportWrite(value, super.isFormValid, () {
      super.isFormValid = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'LoginStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$isLoggedInAtom =
      Atom(name: 'LoginStoreBase.isLoggedIn', context: context);

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  late final _$returnLoginAtom =
      Atom(name: 'LoginStoreBase.returnLogin', context: context);

  @override
  ObservableFuture<dynamic>? get returnLogin {
    _$returnLoginAtom.reportRead();
    return super.returnLogin;
  }

  @override
  set returnLogin(ObservableFuture<dynamic>? value) {
    _$returnLoginAtom.reportWrite(value, super.returnLogin, () {
      super.returnLogin = value;
    });
  }

  late final _$LoginStoreBaseActionController =
      ActionController(name: 'LoginStoreBase', context: context);

  @override
  dynamic doLogin(dynamic user, dynamic pass) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.doLogin');
    try {
      return super.doLogin(user, pass);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLogin: ${isLogin},
isFormValid: ${isFormValid},
loading: ${loading},
isLoggedIn: ${isLoggedIn},
returnLogin: ${returnLogin}
    ''';
  }
}
