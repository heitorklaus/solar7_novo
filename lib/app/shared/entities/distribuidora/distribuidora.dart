// ignore_for_file: non_constant_identifier_names

import 'package:mobx/mobx.dart';

part 'distribuidora.g.dart';

class Distribuidora extends _Distribuidora with _$Distribuidora {
  Distribuidora(
      {int? id,
      String? item,
      String? cpf_cnpj,
      String? endereco,
      String? telefone,
      String? cidade,
      String? uf})
      : super(
            id: id,
            item: item,
            cpf_cnpj: cpf_cnpj,
            endereco: endereco,
            telefone: telefone,
            cidade: cidade,
            uf: uf);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "item": item,
      "cpf_cnpj": cpf_cnpj,
      "endereco": endereco,
      "telefone": telefone,
      "cidade": cidade,
      "uf": uf
    };
  }

  factory Distribuidora.fromJson(Map json) {
    return Distribuidora(
        id: json['id'],
        item: json['item'],
        cpf_cnpj: json['cpf_cnpj'],
        endereco: json['endereco'],
        telefone: json['telefone'],
        cidade: json['cidade'],
        uf: json['uf']);
  }
}

abstract class _Distribuidora with Store {
  @observable
  int? id;

  @observable
  String? item;

  @observable
  String? cpf_cnpj;

  @observable
  String? endereco;

  @observable
  String? telefone;

  @observable
  String? cidade;

  @observable
  String? uf;

  @observable
  _Distribuidora(
      {this.id,
      this.cidade,
      this.cpf_cnpj,
      this.endereco,
      this.item,
      this.telefone,
      this.uf});
}
