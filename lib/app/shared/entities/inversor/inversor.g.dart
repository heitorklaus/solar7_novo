// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inversor.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Inversor on _Inversor, Store {
  late final _$idAtom = Atom(name: '_Inversor.id', context: context);

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

  late final _$itemAtom = Atom(name: '_Inversor.item', context: context);

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

  @override
  String toString() {
    return '''
id: ${id},
item: ${item}
    ''';
  }
}
