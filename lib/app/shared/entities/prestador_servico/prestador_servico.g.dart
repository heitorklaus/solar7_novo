// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prestador_servico.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PrestadorServico on _PrestadorServico, Store {
  late final _$idAtom = Atom(name: '_PrestadorServico.id', context: context);

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$itemAtom =
      Atom(name: '_PrestadorServico.item', context: context);

  @override
  String? get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  @override
  set item(String? value) {
    _$itemAtom.reportWrite(value, super.item, () {
      super.item = value;
    });
  }

  late final _$cpf_cnpjAtom =
      Atom(name: '_PrestadorServico.cpf_cnpj', context: context);

  @override
  String? get cpf_cnpj {
    _$cpf_cnpjAtom.reportRead();
    return super.cpf_cnpj;
  }

  @override
  set cpf_cnpj(String? value) {
    _$cpf_cnpjAtom.reportWrite(value, super.cpf_cnpj, () {
      super.cpf_cnpj = value;
    });
  }

  late final _$enderecoAtom =
      Atom(name: '_PrestadorServico.endereco', context: context);

  @override
  String? get endereco {
    _$enderecoAtom.reportRead();
    return super.endereco;
  }

  @override
  set endereco(String? value) {
    _$enderecoAtom.reportWrite(value, super.endereco, () {
      super.endereco = value;
    });
  }

  late final _$telefoneAtom =
      Atom(name: '_PrestadorServico.telefone', context: context);

  @override
  String? get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(String? value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  late final _$cidadeAtom =
      Atom(name: '_PrestadorServico.cidade', context: context);

  @override
  String? get cidade {
    _$cidadeAtom.reportRead();
    return super.cidade;
  }

  @override
  set cidade(String? value) {
    _$cidadeAtom.reportWrite(value, super.cidade, () {
      super.cidade = value;
    });
  }

  late final _$ufAtom = Atom(name: '_PrestadorServico.uf', context: context);

  @override
  String? get uf {
    _$ufAtom.reportRead();
    return super.uf;
  }

  @override
  set uf(String? value) {
    _$ufAtom.reportWrite(value, super.uf, () {
      super.uf = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
item: ${item},
cpf_cnpj: ${cpf_cnpj},
endereco: ${endereco},
telefone: ${telefone},
cidade: ${cidade},
uf: ${uf}
    ''';
  }
}
