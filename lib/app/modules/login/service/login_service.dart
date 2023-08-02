import 'dart:convert';

import 'package:solardino/app/modules/login/entities/auth.dart';
import 'package:solardino/app/modules/login/interface/login_interface.dart';
import 'package:solardino/app/modules/home/interface/home_interface.dart';
import 'package:http/http.dart' as http;
import 'package:solardino/app/shared/database_settings/initialization_helper.dart';

import '../../../shared/api/api.dart';
import '../../../shared/credentials/token.dart';
import '../../../shared/database_settings/shared_pref_helper.dart';

class LoginService implements LoginInterface {
  @override
  Future<Auth> doLogin(user, pass) async {
    var body = jsonEncode({'username': user, 'password': pass});
    final url = Uri.parse('${Api().url}auth/signin');
    final response = await http.post(url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${Token().token}',
        },
        body: body);

    if (response.statusCode == 200) {
      final data = Auth.fromJson(json.decode(response.body));

      return data;
    } else {
      throw Exception();
    }
  }
}
