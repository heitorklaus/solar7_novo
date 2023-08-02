// ignore_for_file: non_constant_identifier_names

import 'package:mobx/mobx.dart';

import '../data_hora_criacao/data_hora_criacao.dart';
import '../inversor/inversor.dart';
import '../placasolar/placasolar.dart';
import '../usuario/user.dart';

part 'usinas_to_post.g.dart';

class UsinasToPost extends _UsinasToPost with _$UsinasToPost {
  UsinasToPost({
    int? id,
    Inversor? inversor,
    PlacaSolar? idPlacasolar,
    User? user,
    int? quantidadeDeModulos,
    double? valor_de_custo_todos_modulos,
    double? potencia_do_sistema,
    String? objItensDasUsinas,
    String? objServicosDasUsinas,
    double? imposto,
    String? geracao_em_kilowatts,
    double? valor_de_custo_do_sistema,
    double? lucro_porcentagem,
    double? lucro_reais,
    double? valor_de_venda_final,
    String? alias,
    DataHoraCriacao? data_hora_criacao,
    String? idCodigoDaUsina,
  }) : super(
            id: id,
            inversor: inversor,
            idPlacasolar: idPlacasolar,
            user: user,
            quantidadeDeModulos: quantidadeDeModulos,
            valor_de_custo_todos_modulos: valor_de_custo_todos_modulos,
            potencia_do_sistema: potencia_do_sistema,
            objItensDasUsinas: objItensDasUsinas,
            objServicosDasUsinas: objServicosDasUsinas,
            imposto: imposto,
            geracao_em_kilowatts: geracao_em_kilowatts,
            valor_de_custo_do_sistema: valor_de_custo_do_sistema,
            lucro_porcentagem: lucro_porcentagem,
            lucro_reais: lucro_reais,
            valor_de_venda_final: valor_de_venda_final,
            alias: alias,
            data_hora_criacao: data_hora_criacao,
            idCodigoDaUsina: idCodigoDaUsina);

  Map<String, dynamic> toJson() {
    return {
      "id_inversor": inversor,
      "id_placasolar": idPlacasolar,
      "quantidade_de_modulos": quantidadeDeModulos,
      "valor_de_custo_todos_modulos": valor_de_custo_todos_modulos,
      "potencia_do_sistema": potencia_do_sistema,
      "obj_itens_das_usinas": objItensDasUsinas,
      "obj_servicos_das_usinas": objServicosDasUsinas,
      "imposto": imposto,
      "geracao_em_kilowatts": geracao_em_kilowatts,
      "valor_de_custo_do_sistema": valor_de_custo_do_sistema,
      "lucro_porcentagem": lucro_porcentagem,
      "lucro_reais": lucro_reais,
      "valor_de_venda_final": valor_de_venda_final,
      "alias": alias,
      "data_hora_criacao": data_hora_criacao,
      "id_codigo_da_usinas": idCodigoDaUsina
    };
  }

  factory UsinasToPost.fromJson(Map json) {
    return UsinasToPost(
        id: json['id'],
        inversor: json['id_inversor'] == null
            ? Inversor(id: 0)
            : Inversor.fromJson(json['id_inversor']),
        user: User.fromJson(json['usuario']),
        idPlacasolar: json['id_placasolar'] == null
            ? PlacaSolar(id: 0)
            : PlacaSolar.fromJson(json['id_placasolar']),
        quantidadeDeModulos: json['quantidade_de_modulos'],
        valor_de_custo_todos_modulos: json['valor_de_custo_todos_modulos'],
        potencia_do_sistema: json['potencia_do_sistema'],
        objItensDasUsinas: json['obj_itens_das_usinas'],
        objServicosDasUsinas: json['obj_servicos_das_usinas'],
        imposto: json['imposto'],
        geracao_em_kilowatts: json['geracao_em_kilowatts'],
        valor_de_custo_do_sistema: json['valor_de_custo_do_sistema'],
        lucro_porcentagem: json['lucro_porcentagem'],
        lucro_reais: json['lucro_reais'],
        valor_de_venda_final: json['valor_de_venda_final'],
        alias: json['alias'],
        data_hora_criacao: DataHoraCriacao.fromJson(json['data_hora_criacao']),
        idCodigoDaUsina: json['idCodigoDaUsina']);
  }
}

abstract class _UsinasToPost with Store {
  @observable
  int? id;

  @observable
  Inversor? inversor;

  @observable
  User? user;

  @observable
  PlacaSolar? idPlacasolar;

  @observable
  int? quantidadeDeModulos;

  @observable
  double? valor_de_custo_todos_modulos;

  @observable
  double? potencia_do_sistema;

  @observable
  String? objItensDasUsinas;

  @observable
  String? objServicosDasUsinas;

  @observable
  double? imposto;

  @observable
  String? geracao_em_kilowatts;

  @observable
  double? valor_de_custo_do_sistema;

  @observable
  double? lucro_porcentagem;

  @observable
  double? lucro_reais;

  @observable
  double? valor_de_venda_final;

  @observable
  String? alias;

  @observable
  DataHoraCriacao? data_hora_criacao;

  @observable
  String? idCodigoDaUsina;
  _UsinasToPost(
      {this.id,
      this.inversor,
      this.idPlacasolar,
      this.user,
      this.quantidadeDeModulos,
      this.valor_de_custo_todos_modulos,
      this.potencia_do_sistema,
      this.objItensDasUsinas,
      this.objServicosDasUsinas,
      this.imposto,
      this.geracao_em_kilowatts,
      this.valor_de_custo_do_sistema,
      this.lucro_porcentagem,
      this.lucro_reais,
      this.valor_de_venda_final,
      this.alias,
      this.data_hora_criacao,
      this.idCodigoDaUsina});
}
