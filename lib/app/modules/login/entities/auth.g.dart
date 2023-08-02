// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Auth on _Auth, Store {
  late final _$idAtom = Atom(name: '_Auth.id', context: context);

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$emailAtom = Atom(name: '_Auth.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$nameAtom = Atom(name: '_Auth.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$empresaAtom = Atom(name: '_Auth.empresa', context: context);

  @override
  String? get empresa {
    _$empresaAtom.reportRead();
    return super.empresa;
  }

  @override
  set empresa(String? value) {
    _$empresaAtom.reportWrite(value, super.empresa, () {
      super.empresa = value;
    });
  }

  late final _$groupKeyAtom = Atom(name: '_Auth.groupKey', context: context);

  @override
  String? get groupKey {
    _$groupKeyAtom.reportRead();
    return super.groupKey;
  }

  @override
  set groupKey(String? value) {
    _$groupKeyAtom.reportWrite(value, super.groupKey, () {
      super.groupKey = value;
    });
  }

  late final _$isOwnerAtom = Atom(name: '_Auth.isOwner', context: context);

  @override
  String? get isOwner {
    _$isOwnerAtom.reportRead();
    return super.isOwner;
  }

  @override
  set isOwner(String? value) {
    _$isOwnerAtom.reportWrite(value, super.isOwner, () {
      super.isOwner = value;
    });
  }

  late final _$accessTokenAtom =
      Atom(name: '_Auth.accessToken', context: context);

  @override
  String? get accessToken {
    _$accessTokenAtom.reportRead();
    return super.accessToken;
  }

  @override
  set accessToken(String? value) {
    _$accessTokenAtom.reportWrite(value, super.accessToken, () {
      super.accessToken = value;
    });
  }

  late final _$tokenTypeAtom = Atom(name: '_Auth.tokenType', context: context);

  @override
  String? get tokenType {
    _$tokenTypeAtom.reportRead();
    return super.tokenType;
  }

  @override
  set tokenType(String? value) {
    _$tokenTypeAtom.reportWrite(value, super.tokenType, () {
      super.tokenType = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
email: ${email},
name: ${name},
empresa: ${empresa},
groupKey: ${groupKey},
isOwner: ${isOwner},
accessToken: ${accessToken},
tokenType: ${tokenType}
    ''';
  }
}
