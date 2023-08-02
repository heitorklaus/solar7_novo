// ignore_for_file: non_constant_identifier_names

import 'package:mobx/mobx.dart';

part 'autocomplete_entitie.g.dart';

class AutoCompleteEntitie extends _AutoCompleteEntitie
    with _$AutoCompleteEntitie {
  AutoCompleteEntitie({
    int? id,
    String? item,
    dynamic qtd,
    double? potencia,
    double? valor_de_custo,
    double? valor_de_venda,
    String? categoria,
  }) : super(
            item: item,
            id: id,
            qtd: qtd,
            potencia: potencia,
            valor_de_custo: valor_de_custo,
            valor_de_venda: valor_de_venda,
            categoria: categoria);

  Map<String, dynamic> toJson() {
    return {
      "item": item,
      "id": id,
      "qtd": qtd,
      "potencia": potencia,
      "valor_de_custo": valor_de_custo,
      "valor_de_venda": valor_de_venda,
      "categoria": categoria
    };
  }

  factory AutoCompleteEntitie.fromJson(Map json) {
    return AutoCompleteEntitie(
      item: json['item'],
      id: json['id'],
      qtd: json['qtd'],
      potencia: json['potencia'],
      valor_de_custo: json['valor_de_custo'],
      valor_de_venda: json['valor_de_venda'],
      categoria: json['imagem']?['item'],
    );
  }
}

abstract class _AutoCompleteEntitie with Store {
  @observable
  String? item;
  @observable
  int? id;

  @observable
  dynamic qtd;
  @observable
  double? potencia;
  @observable
  double? valor_de_custo;
  @observable
  double? valor_de_venda;
  @observable
  String? categoria;
  // @observable
  // bool? done = false;

  // @action
  // void toggleDone() => done = !done!;

  @observable
  _AutoCompleteEntitie(
      {this.item,
      this.id,
      this.qtd,
      this.potencia,
      this.valor_de_custo,
      this.valor_de_venda,
      this.categoria});
}
