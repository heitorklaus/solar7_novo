// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_hora_criacao.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DataHoraCriacao on _DataHoraCriacao, Store {
  late final _$diaAtom = Atom(name: '_DataHoraCriacao.dia', context: context);

  @override
  int? get dia {
    _$diaAtom.reportRead();
    return super.dia;
  }

  @override
  set dia(int? value) {
    _$diaAtom.reportWrite(value, super.dia, () {
      super.dia = value;
    });
  }

  late final _$mesAtom = Atom(name: '_DataHoraCriacao.mes', context: context);

  @override
  int? get mes {
    _$mesAtom.reportRead();
    return super.mes;
  }

  @override
  set mes(int? value) {
    _$mesAtom.reportWrite(value, super.mes, () {
      super.mes = value;
    });
  }

  late final _$anoAtom = Atom(name: '_DataHoraCriacao.ano', context: context);

  @override
  int? get ano {
    _$anoAtom.reportRead();
    return super.ano;
  }

  @override
  set ano(int? value) {
    _$anoAtom.reportWrite(value, super.ano, () {
      super.ano = value;
    });
  }

  @override
  String toString() {
    return '''
dia: ${dia},
mes: ${mes},
ano: ${ano}
    ''';
  }
}
