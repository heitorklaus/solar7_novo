// ignore_for_file: non_constant_identifier_names

import 'package:mobx/mobx.dart';

import '../data_hora_criacao/data_hora_criacao.dart';
import '../inversor/inversor.dart';
import '../placasolar/placasolar.dart';
import '../prestador_servico/prestador_servico.dart';
import '../usuario/user.dart';

part 'usinas.g.dart';

class Usinas extends _Usinas with _$Usinas {
  Usinas({
    int? id,
    Inversor? inversor,
    //  List<ItemUsina>? item_usina,
    PrestadorServico? prestadorServico,
    PlacaSolar? placaSolar,
    User? user,
    double? geracao,
    double? valor_de_custo,
    double? valor_de_venda,
    double? valor_imposto,
    double? valor_lucro,
    String? alias,
    double? area_da_usina,
    double? peso_da_usina,
    double? potencia_da_usina,
    int? quantidade_de_placas,
    DataHoraCriacao? data_hora_criacao,
  }) : super(
            id: id,
            inversor: inversor,
            prestadorServico: prestadorServico,
            placaSolar: placaSolar,
            user: user,
            geracao: geracao,
            valor_de_custo: valor_de_custo,
            valor_de_venda: valor_de_venda,
            valor_imposto: valor_imposto,
            valor_lucro: valor_lucro,
            alias: alias,
            area_da_usina: area_da_usina,
            peso_da_usina: peso_da_usina,
            potencia_da_usina: potencia_da_usina,
            quantidade_de_placas: quantidade_de_placas,
            data_hora_criacao: data_hora_criacao);

  Map<String, dynamic> toJson() {
    return {
      "inversor": inversor,
      //   "item": item_usina,
      "placa_solar": placaSolar,

      "geracao": geracao,
      "valor_de_custo": valor_de_custo,
      "valor_de_venda": valor_de_venda,
      "valor_imposto": valor_imposto,
      "valor_lucro": valor_lucro,
      "alias": alias,
      "area_da_usina": area_da_usina,
      "peso_da_usina": peso_da_usina,
      "data_hora_criacao": data_hora_criacao,
      "potencia_da_usina": potencia_da_usina,
      "quantidade_de_placas": quantidade_de_placas,
    };
  }

  factory Usinas.fromJson(Map json) {
    return Usinas(
        id: json['id'],
        inversor: Inversor.fromJson(json['inversor']),
        // item_usina: json['item']
        //     .map<ItemUsina>((json) => ItemUsina.fromJson(json))
        //   .toList(),
        // prestadorServico: PrestadorServico?.fromJson(json['prestador_servico']),
        placaSolar: PlacaSolar.fromJson(json['placa_solar']),
        //    user: User.fromJson(json['usuario']),
        geracao: json['geracao'],
        valor_de_custo: json['valor_de_custo'],
        valor_de_venda: json['valor_de_venda'],
        valor_imposto: json['valor_imposto'],
        valor_lucro: json['valor_lucro'],
        alias: json['alias'],
        area_da_usina: json['area_da_usina'],
        peso_da_usina: json['peso_da_usina'],
        data_hora_criacao: DataHoraCriacao.fromJson(json['data_hora_criacao']),
        potencia_da_usina: json['potencia_da_usina'],
        quantidade_de_placas: json['quantidade_de_placas']);
  }
}

abstract class _Usinas with Store {
  @observable
  int? id;

  @observable
  Inversor? inversor;

  // @observable
  // List<ItemUsina>? item_usina;

  @observable
  PrestadorServico? prestadorServico;

  @observable
  User? user;

  @observable
  double? geracao;

  @observable
  double? valor_de_custo;

  @observable
  double? valor_de_venda;

  @observable
  double? valor_imposto;

  @observable
  double? valor_lucro;

  @observable
  String? alias;

  @observable
  double? area_da_usina;

  @observable
  double? peso_da_usina;

  @observable
  DataHoraCriacao? data_hora_criacao;

  @observable
  double? potencia_da_usina;

  @observable
  int? quantidade_de_placas;

  @observable
  PlacaSolar? placaSolar;

  @observable
  _Usinas(
      {this.id,
      this.placaSolar,
      this.inversor,
      //    this.item_usina,
      this.user,
      this.geracao,
      this.valor_de_custo,
      this.valor_de_venda,
      this.valor_imposto,
      this.valor_lucro,
      this.alias,
      this.area_da_usina,
      this.peso_da_usina,
      this.data_hora_criacao,
      this.quantidade_de_placas,
      this.potencia_da_usina,
      PrestadorServico? prestadorServico});
}
