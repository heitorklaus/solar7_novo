// ignore_for_file: non_constant_identifier_names

import 'package:mobx/mobx.dart';
import 'package:solardino/app/shared/entities/distribuidora/distribuidora.dart';

import '../fabricante/fabricante.dart';

part 'placasolar.g.dart';

class PlacaSolar extends _PlacaSolar with _$PlacaSolar {
  PlacaSolar(
      {int? id,
      String? item,
      double? potencia,
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

  factory PlacaSolar.fromJson(Map json) {
    return PlacaSolar(
        id: json['id'],
        item: json['item'],
        potencia: json['potencia'],
        datasheet: json['datasheet'],
        descricao: json['descricao'],
        valor_de_custo: json['valor_de_custo'],
        valor_de_venda: json['valor_de_venda'],
        fabricante: Fabricante.fromJson(json['fabricante'] ?? {"id": "0"}),
        distribuidora: Distribuidora.fromJson(
          json['distribuidora'],
        ),
        peso: json['peso'],
        comprimento: json['comprimento'],
        largura: json['largura']);
  }
}

abstract class _PlacaSolar with Store {
  @observable
  int? id;

  @observable
  String? item;

  @observable
  double? potencia;

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
  _PlacaSolar(
      {this.id,
      this.datasheet,
      this.descricao,
      this.distribuidora,
      this.fabricante,
      this.item,
      this.potencia,
      this.valor_de_custo,
      this.valor_de_venda,
      this.comprimento,
      this.largura,
      this.peso});
}
