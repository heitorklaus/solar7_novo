import 'dart:convert';

import 'package:solardino/app/shared/entities/usinas/usinas.dart';
import 'package:solardino/app/modules/home/interface/home_interface.dart';
import 'package:http/http.dart' as http;
import 'package:solardino/app/shared/database_settings/initialization_helper.dart';

import '../../../shared/api/api.dart';
import '../../../shared/credentials/token.dart';
import '../../../shared/database_settings/shared_pref_helper.dart';
import '../../../shared/entities/usinas/usinas_to_post.dart';

class HomeService implements HomeInterface {
  @override
  Future<List<UsinasToPost>> getLista(String search) async {
    final url =
        Uri.parse('${Api().url}usinas/get/?size=1000&page=0&query=$search');
    final response = await http.get(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token().token}',
    });

    if (response.statusCode == 200) {
      final users = json.decode(response.body);

      try {
        final posts = users["content"]
            .map<UsinasToPost>((json) => UsinasToPost.fromJson(json))
            .toList();
        return posts;
      } on Exception catch (e) {
        print(e.toString());
        throw Exception("Error on server");
      }
    } else {
      throw Exception();
    }

    // if (response.statusCode == 200) {
    //   dynamic users;

    //   final posts = Mock().json();

    //   return posts;
    // } else {
    //   throw Exception();
    // }
  }
  // }

  @override
  Future getPotenciaNecessaria(search) async {
    // var irradiacao = await Prefs.getString('irradiacao');
    // var eficiencia = await Prefs.getString('efici');

    // return (double.parse(search) /
    //         double.parse(irradiacao) /
    //         double.parse(eficiencia) /
    //         30)
    //     .toStringAsFixed(2)
    //     .toString();
  }

  @override
  Future getWindow(search) async {
    if (search == '/inicio') return [];
    return [
      {"window": "usinas"}
    ];
  }
}
