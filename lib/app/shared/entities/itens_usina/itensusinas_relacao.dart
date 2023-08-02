//"{"id":877,"id_usina":876,"id_item_qtd":"5:1","id_servicos_qtd":"1:1"}"

import 'package:mobx/mobx.dart';

part 'itensusinas_relacao.g.dart';

class ItensUsinasRelacao extends _ItensUsinasRelacao with _$ItensUsinasRelacao {
  // ignore: non_constant_identifier_names
  ItensUsinasRelacao(
      {int? id, int? id_usina, String? id_item_qtd, String? id_servicos_qtd})
      : super(
            id: id,
            id_usina: id_usina,
            id_item_qtd: id_item_qtd,
            id_servicos_qtd: id_servicos_qtd);

  Map<String, dynamic> toJson() {
    return {
      "id_item_qtd": id_item_qtd,
      "id_usina": id_usina,
      "id_servicos_qtd": id_servicos_qtd
    };
  }

  factory ItensUsinasRelacao.fromJson(Map json) {
    return ItensUsinasRelacao(
        id: json['id'],
        id_item_qtd: json['id_item_qtd'],
        id_usina: json['id_usina'],
        id_servicos_qtd: json['id_servicos_qtd']);
  }
}

abstract class _ItensUsinasRelacao with Store {
  @observable
  int? id;
  @observable
  String? id_item_qtd;
  @observable
  // ignore: non_constant_identifier_names
  int? id_usina;
  @observable
  String? id_servicos_qtd;

  @observable
  // ignore: non_constant_identifier_names
  _ItensUsinasRelacao(
      {this.id, this.id_item_qtd, this.id_usina, this.id_servicos_qtd});
}
