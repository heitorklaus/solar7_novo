// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Config on _Config, Store {
  late final _$irradiacaoAtom =
      Atom(name: '_Config.irradiacao', context: context);

  @override
  double? get irradiacao {
    _$irradiacaoAtom.reportRead();
    return super.irradiacao;
  }

  @override
  set irradiacao(double? value) {
    _$irradiacaoAtom.reportWrite(value, super.irradiacao, () {
      super.irradiacao = value;
    });
  }

  late final _$eficienciaAtom =
      Atom(name: '_Config.eficiencia', context: context);

  @override
  double? get eficiencia {
    _$eficienciaAtom.reportRead();
    return super.eficiencia;
  }

  @override
  set eficiencia(double? value) {
    _$eficienciaAtom.reportWrite(value, super.eficiencia, () {
      super.eficiencia = value;
    });
  }

  @override
  String toString() {
    return '''
irradiacao: ${irradiacao},
eficiencia: ${eficiencia}
    ''';
  }
}
