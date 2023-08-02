// ignore_for_file: non_constant_identifier_names

import 'package:mobx/mobx.dart';

part 'auth.g.dart';

class Auth extends _Auth with _$Auth {
  Auth({
    int? id,
    String? email,
    String? name,
    String? empresa,
    String? groupKey,
    String? isOwner,
    String? accessToken,
    String? tokenType,
  }) : super(
            id: id,
            email: email,
            name: name,
            empresa: empresa,
            groupKey: groupKey,
            isOwner: isOwner,
            accessToken: accessToken,
            tokenType: tokenType);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "name": name,
      "empresa": empresa,
      "groupKey": groupKey,
      "isOwner": isOwner,
      "accessToken": accessToken,
      "tokenType": tokenType
    };
  }

  factory Auth.fromJson(Map json) {
    return Auth(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      empresa: json['empresa'],
      groupKey: json['groupKey'],
      isOwner: json['isOwner'],
      accessToken: json['accessToken'],
      tokenType: json['tokenType'],
    );
  }
}

abstract class _Auth with Store {
  @observable
  int? id;
  @observable
  String? email;
  @observable
  String? name;
  @observable
  String? empresa;
  @observable
  String? groupKey;

  @observable
  String? isOwner;
  @observable
  String? accessToken;
  @observable
  String? tokenType;

  @observable
  _Auth({
    this.id,
    this.email,
    this.name,
    this.empresa,
    this.groupKey,
    this.isOwner,
    this.accessToken,
    this.tokenType,
  });
}
