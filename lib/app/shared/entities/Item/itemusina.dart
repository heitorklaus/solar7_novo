// ignore_for_file: non_constant_identifier_names

import 'package:mobx/mobx.dart';
import 'package:solardino/app/shared/entities/distribuidora/distribuidora.dart';

import '../fabricante/fabricante.dart';

part 'itemusina.g.dart';

class ItemUsina extends _ItemUsina with _$ItemUsina {
  ItemUsina(
      {int? id,
      String? item,
      double? potencia,
      String? imagem,
      String? datasheet,
      String? descricao,
      double? valor_de_custo,
      double? valor_de_venda,
      Fabricante? fabricante,
      Distribuidora? distribuidora,
      double? peso,
      double? comprimento,
      double? largura})
      : super(
            id: id,
            item: item,
            potencia: potencia,
            imagem: imagem,
            datasheet: datasheet,
            descricao: descricao,
            valor_de_custo: valor_de_custo,
            valor_de_venda: valor_de_venda,
            fabricante: fabricante,
            distribuidora: distribuidora,
            peso: peso,
            comprimento: comprimento,
            largura: largura);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "item": item,
      "potencia": potencia,
      "imagem": imagem,
      "datasheet": datasheet,
      "descricao": descricao,
      "valor_de_custo": valor_de_custo,
      "valor_de_venda": valor_de_venda,
      "fabricante": fabricante,
      "distribuidora": distribuidora,
      "peso": peso,
      "comprimento": comprimento,
      "largura": largura,
    };
  }

  factory ItemUsina.fromJson(Map json) {
    return ItemUsina(
      id: json['id'],
      item: json['item'],
      potencia: json['potencia'],
      imagem: json['imagem'],
      datasheet: json['datasheet'],
      descricao: json['descricao'],
      valor_de_custo: json['valor_de_custo'],
      valor_de_venda: json['valor_de_venda'],
      fabricante: Fabricante.fromJson(json['fabricante']),
      distribuidora: Distribuidora.fromJson(json['distribuidora']),
    );
  }
}

abstract class _ItemUsina with Store {
  @observable
  int? id;

  @observable
  String? item;

  @observable
  double? potencia;

  @observable
  String? imagem;

  @observable
  String? datasheet;

  @observable
  String? descricao;

  @observable
  double? valor_de_custo;

  @observable
  double? valor_de_venda;

  @observable
  Fabricante? fabricante;

  @observable
  Distribuidora? distribuidora;

  @observable
  double? peso;
  @observable
  double? comprimento;
  @observable
  double? largura;

  @observable
  _ItemUsina(
      {this.id,
      this.datasheet,
      this.descricao,
      this.distribuidora,
      this.fabricante,
      this.imagem,
      this.item,
      this.potencia,
      this.valor_de_custo,
      this.valor_de_venda,
      this.comprimento,
      this.largura,
      this.peso});
}
