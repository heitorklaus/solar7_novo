// ignore_for_file: non_constant_identifier_names

import 'package:mobx/mobx.dart';

part 'user.g.dart';

class User extends _User with _$User {
  User({int? id, String? username, String? email})
      : super(id: id, username: username, email: email);

  Map<String, dynamic> toJson() {
    return {"id": id, "email": email, "username": username};
  }

  factory User.fromJson(Map json) {
    return User(
        id: json['id'], email: json['email'], username: json['username']);
  }
}

abstract class _User with Store {
  @observable
  int? id;

  @observable
  String? username;

  @observable
  String? email;

  @observable
  _User({
    this.id,
    this.email,
    this.username,
  });
}
