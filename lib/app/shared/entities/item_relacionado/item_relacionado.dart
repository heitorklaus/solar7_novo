//"{"id":877,"id_usina":876,"id_item_qtd":"5:1","id_servicos_qtd":"1:1"}"

import 'package:mobx/mobx.dart';

part 'item_relacionado.g.dart';

class ItenRelacionado extends _ItenRelacionado with _$ItenRelacionado {
  // ignore: non_constant_identifier_names
  ItenRelacionado({int? id, String? item, String? qtd, double? valor_de_custo})
      : super(id: id, item: item, qtd: qtd, valor_de_custo: valor_de_custo);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "item": item,
      "qtd": qtd,
      "valor_de_custo": valor_de_custo
    };
  }

  factory ItenRelacionado.fromJson(Map json) {
    return ItenRelacionado(
        id: json['id'],
        item: json['item'],
        qtd: json['qtd'],
        valor_de_custo: json['valor_de_custo']);
  }
}

abstract class _ItenRelacionado with Store {
  @observable
  int? id;
  @observable
  String? item;
  @observable
  String? qtd;
  @observable
  double? valor_de_custo;

  // ignore: non_constant_identifier_names
  _ItenRelacionado({this.id, this.item, this.qtd, this.valor_de_custo});
}
