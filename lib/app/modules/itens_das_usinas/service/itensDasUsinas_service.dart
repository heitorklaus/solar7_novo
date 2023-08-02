import 'package:solardino/app/modules/itens_das_usinas/interface/itens_das_usinas_interface.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../shared/api/api.dart';
import '../../../shared/credentials/token.dart';
import '../../../shared/dialog/dialog.dart';
import '../../../shared/dialog/dialogClass.dart';
import '../../../shared/entities/Item/itemusina.dart';
import '../../../shared/entities/usinas/usinas_to_post.dart';

class ItensDasUsinasService implements ItensDasUsinasInterface {
  @override
  Future getListaDeItens(String search, context) async {
    final url = Uri.parse(
        '${Api().url}itensusinas/get/?size=1000&page=0&query=&groupKey=SOLI');
    final response = await http.get(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Token().token}',
    }).timeout(
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
            .map<ItemUsina>((json) => ItemUsina.fromJson(json))
            .toList();

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

  @override
  Future getPotenciaNecessaria(search) {
    // TODO: implement getPotenciaNecessaria
    throw UnimplementedError();
  }

  @override
  Future getWindow(window) {
    // TODO: implement getWindow
    throw UnimplementedError();
  }

  @override
  getItemToEdit(int id, context) {
    // TODO: implement getItemToEdit
    throw UnimplementedError();
  }
}
