import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:solardino/app/shared/api/api.dart';
import 'package:solardino/app/shared/credentials/token.dart';
import 'package:http/http.dart' as http;
import 'package:solardino/app/shared/entities/usinas/usinas.dart';
import 'package:solardino/app/shared/entities/usinas/usinas_to_post.dart';
import '../../../shared/dialog/dialog.dart';
import '../../../shared/dialog/dialogClass.dart';
import '../../../shared/entities/Item/itemusina.dart';
import '../../../shared/entities/item_relacionado/item_relacionado.dart';
import '../interface/usinas_interface.dart';

class UsinasService implements UsinasInterface {
  final url_update_usina = Uri.parse('${Api().url}usinas/update');
  final url_post_usina = Uri.parse('${Api().url}usinas/posts');
  final url_get_usina = Uri.parse('${Api().url}usinas/get/');
  final url_get_todos_ids_usinas = Uri.parse(
      '${Api().url}itensusinas_relacionados_na_usina/get/?size=1000&page=0&iditem=');
  final encoding = Encoding.getByName('utf-8');
  final url_get_todos_servicos_ids_usinas = Uri.parse(
      '${Api().url}servicos_relacionados_na_usina/get/?size=1000&page=0&idservico=');

  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Token().token}',
  };

  @override
  Future cadastrarNovaUsina(usina, context) async {
    try {
      String jsonBody = json.encode(usina);

      var response = await post(
        url_post_usina,
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      ).timeout(
        const Duration(seconds: 20),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          return http.Response(
              'O Tempo de resposta ou a internet esta muito lenta, tente mais tarde.',
              408); // Request Timeout response status code
        },
      ).catchError((e) {
        showDialog(
            context: context,
            builder: (context) => DialogClass(
                dialogType: 'exceptionPostError', message: e.toString()));
      });
      if (response.statusCode == 200) {
        return response;
      }
    } on Exception catch (e) {
      showDialog(
          context: context,
          builder: (context) => DialogClass(
              dialogType: 'exceptionPostError', message: e.toString()));
    } catch (e) {
      print('AQUI 4');
      showDialog(
          context: context,
          builder: (context) => DialogClass(
              dialogType: 'exceptionPostError', message: e.toString()));
    }
  }

  @override
  Future alterarUsina(id, usina, context) async {
    try {
      String jsonBody = json.encode(usina);

      var response = await put(
        Uri.parse('${Api().url}usinas/update/$id'),
        headers: headers,
        body: jsonBody,
        encoding: encoding,
      ).timeout(
        const Duration(seconds: 20),
        onTimeout: () {
          // Time has run out, do what you wanted to do.
          return http.Response(
              'O Tempo de resposta ou a internet esta muito lenta, tente mais tarde.',
              408); // Request Timeout response status code
        },
      ).catchError((e) {
        showDialog(
            context: context,
            builder: (context) => DialogClass(
                dialogType: 'exceptionPostError', message: e.toString()));
      });
      if (response.statusCode == 200) {
        return response;
      }
    } on Exception catch (e) {
      showDialog(
          context: context,
          builder: (context) => DialogClass(
              dialogType: 'exceptionPostError', message: e.toString()));
    } catch (e) {
      print('AQUI 4');
      showDialog(
          context: context,
          builder: (context) => DialogClass(
              dialogType: 'exceptionPostError', message: e.toString()));
    }
  }

  @override
  Future getServicosDaUsina(todosIdsParaBuscarDaUsina, context) async {
    if (todosIdsParaBuscarDaUsina == null) {
      List posts = [];

      //List r = [];

      posts.insert(
          0, ItenRelacionado(id: 0, qtd: "0", item: "0", valor_de_custo: 0));

      return posts;
    }

    // explode dos itens
    var servicos = todosIdsParaBuscarDaUsina;
    var explode_servicos = servicos.split("/");
    List listaDeServicosParaBuscar = [];
    List listaDeQuantidadeParaBuscar = [];
    var idDoServico;
    var qtdDoServico;
    var valorDoServico;
    for (var i = 0; i <= explode_servicos.length - 1; i++) {
      var explode_sub_servicos = explode_servicos[i].split(":");
      for (var x = 0; x <= explode_sub_servicos.length - 1; x++) {
        idDoServico = explode_sub_servicos[0];
        qtdDoServico = explode_sub_servicos[1];
        valorDoServico = explode_sub_servicos[2];
      }
      listaDeServicosParaBuscar.add(idDoServico);
      listaDeQuantidadeParaBuscar.add(qtdDoServico);
    }
    print(listaDeServicosParaBuscar.toString());

    // ignore: prefer_interpolation_to_compose_strings
    final url = Uri.parse(
        "$url_get_todos_servicos_ids_usinas${removeStrings(listaDeServicosParaBuscar)}");
    final response = await http.get(url, headers: headers).timeout(
      const Duration(seconds: 20),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'O Tempo de resposta ou a internet esta muito lenta, tente mais tarde.',
            408); // Request Timeout response status code
      },
    ).catchError((e) {
      showDialog(
          context: context,
          builder: (context) => DialogClass(
              dialogType: 'exceptionLoadError', message: e.toString()));
    });
    if (response.statusCode == 200) {
      try {
        final users = json.decode(response.body);

        final posts = users["content"]
            .map<ItenRelacionado>((json) => ItenRelacionado.fromJson(json))
            .toList();

        for (var t = 0; t <= listaDeQuantidadeParaBuscar.length - 1; t++) {
          posts[t].qtd = listaDeQuantidadeParaBuscar[t].toString();
        }

        return posts;
      } on Exception catch (e) {
        showDialog(
            context: context,
            builder: (context) => DialogClass(
                dialogType: 'exceptionLoadError', message: response.body));
      }
    } else {
      print('CAIU AQUI 2');
      showDialog(
          context: context,
          builder: (context) => DialogClass(
              dialogType: 'exceptionLoadError', message: response.body));
    }
    throw UnimplementedError();
  }

  @override
  Future getItensDaUsina(todosIdsParaBuscarDaUsina, context) async {
    if (todosIdsParaBuscarDaUsina == null) {
      List posts = [];

      //List r = [];

      posts.insert(
          0, ItenRelacionado(id: 0, qtd: "0", item: "0", valor_de_custo: 0));

      return posts;
    }

    // explode dos itens
    var itens = todosIdsParaBuscarDaUsina;
    var explode_itens = itens.split("/");
    List listaDeItensParaBuscar = [];
    List listaDeQuantidadeParaBuscar = [];
    var idDoItem;
    var qtdDoItem;
    var valorDoItem;
    for (var i = 0; i <= explode_itens.length - 1; i++) {
      var explode_sub_itens = explode_itens[i].split(":");
      for (var x = 0; x <= explode_sub_itens.length - 1; x++) {
        idDoItem = explode_sub_itens[0];
        qtdDoItem = explode_sub_itens[1];
        valorDoItem = explode_sub_itens[2];
      }
      listaDeItensParaBuscar.add(idDoItem);
      listaDeQuantidadeParaBuscar.add(qtdDoItem);
    }
    print(listaDeItensParaBuscar.toString());

    // ignore: prefer_interpolation_to_compose_strings
    final url = Uri.parse(
        "$url_get_todos_ids_usinas${removeStrings(listaDeItensParaBuscar)}");
    final response = await http.get(url, headers: headers).timeout(
      const Duration(seconds: 20),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'O Tempo de resposta ou a internet esta muito lenta, tente mais tarde.',
            408); // Request Timeout response status code
      },
    ).catchError((e) {
      showDialog(
          context: context,
          builder: (context) => DialogClass(
              dialogType: 'exceptionLoadError', message: e.toString()));
    });
    if (response.statusCode == 200) {
      try {
        final users = json.decode(response.body);

        final posts = users["content"]
            .map<ItenRelacionado>((json) => ItenRelacionado.fromJson(json))
            .toList();

        for (var t = 0; t <= listaDeQuantidadeParaBuscar.length - 1; t++) {
          posts[t].qtd = listaDeQuantidadeParaBuscar[t].toString();
        }

        //List r = [];

        return posts;
      } on Exception catch (e) {
        showDialog(
            context: context,
            builder: (context) => DialogClass(
                dialogType: 'exceptionLoadError', message: response.body));
      }
    } else {
      print('CAIU AQUI 2');
      showDialog(
          context: context,
          builder: (context) => DialogClass(
              dialogType: 'exceptionLoadError', message: response.body));
    }
    throw UnimplementedError();
  }

  @override
  Future getUsinaToEdit(id, context) async {
    // ignore: prefer_interpolation_to_compose_strings
    final url = Uri.parse("$url_get_usina$id");
    final response = await http.get(url, headers: headers).timeout(
      const Duration(seconds: 20),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'O Tempo de resposta ou a internet esta muito lenta, tente mais tarde.',
            408); // Request Timeout response status code
      },
    ).catchError((e) {
      showDialog(
          context: context,
          builder: (context) => DialogClass(
              dialogType: 'exceptionLoadError', message: e.toString()));
    });
    if (response.statusCode == 200) {
      try {
        final users = json.decode(response.body);
        final posts = UsinasToPost.fromJson(users);

        return posts;
      } on Exception catch (e) {
        showDialog(
            context: context,
            builder: (context) => DialogClass(
                dialogType: 'exceptionLoadError', message: response.body));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => DialogClass(
              dialogType: 'exceptionLoadError', message: response.body));
    }
  }

  String removeStrings(todosOsIdsParaBuscarDaUsinaSelecionada) {
    String ids_to_search = todosOsIdsParaBuscarDaUsinaSelecionada
        .toString()
        .toString()
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(" ", "");

    return ids_to_search;
  }
}
