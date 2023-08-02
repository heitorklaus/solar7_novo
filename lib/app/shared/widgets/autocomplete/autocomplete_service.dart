import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:solardino/app/shared/api/api.dart';
import 'package:solardino/app/shared/credentials/token.dart';
import 'package:solardino/app/shared/entities/usinas/usinas.dart';
import 'package:solardino/app/shared/widgets/autocomplete/autocomplete_entitie.dart';

class AutoCompleteService {
  static Future<List<AutoCompleteEntitie>> getTipoDeInversor(
      String query) async {
    final url = Uri.parse('${Api().url}tipodeinversor/get/?size=1000&page=0');
    final response = await http.get(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token().token}',
    });

    if (response.statusCode == 200) {
//      final List lista = json.decode(response.body);
      final data = json.decode(response.body);

      final posts = data["content"]
          .map<AutoCompleteEntitie>(
              (json) => AutoCompleteEntitie.fromJson(json))
          .toList();

      return posts;
    } else {
      throw Exception();
    }
  }

  static Future<List<AutoCompleteEntitie>> getItens(String query) async {
    final url = Uri.parse(
        '${Api().url}itensusinas/get/?size=1000&page=0&query=$query&groupKey=');
    final response = await http.get(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token().token}',
    });

    if (response.statusCode == 200) {
//      final List lista = json.decode(response.body);
      final data = json.decode(response.body);

      final posts = data["content"]
          .map<AutoCompleteEntitie>(
              (json) => AutoCompleteEntitie.fromJson(json))
          .toList();

      return posts;
    } else {
      throw Exception();
    }
  }

  static Future<List<AutoCompleteEntitie>> getTipoModulo(String query) async {
    final url = Uri.parse(
        '${Api().url}modulos/get/?size=1000&page=0&query=$query&groupKey=');
    final response = await http.get(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token().token}',
    });

    if (response.statusCode == 200) {
//      final List lista = json.decode(response.body);
      final data = json.decode(response.body);

      final posts = data["content"]
          .map<AutoCompleteEntitie>(
              (json) => AutoCompleteEntitie.fromJson(json))
          .toList();

      return posts;
    } else {
      throw Exception();
    }
  }

  static Future<List<AutoCompleteEntitie>> getServicosAdicionais(
      String query) async {
    final url = Uri.parse(
        '${Api().url}servicos/get/?size=1000&page=0&query=$query&groupkey=');
    final response = await http.get(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token().token}',
    });

    if (response.statusCode == 200) {
//      final List lista = json.decode(response.body);
      final data = json.decode(response.body);

      final posts = data["content"]
          .map<AutoCompleteEntitie>(
              (json) => AutoCompleteEntitie.fromJson(json))
          .toList();

      return posts;
    } else {
      throw Exception();
    }
  }

  static Future<List<Usinas>> getInversorModelo(String query) async {
    final url = Uri.parse('${Api().url}/usinas/get/?size=1000&page=0');
    final response = await http.get(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token().token}',
    });

    if (response.statusCode == 200) {
      final List users = json.decode(response.body);

      return users.map((json) => Usinas.fromJson(json)).where((user) {
        final nameLower = user.inversor.toString().toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
