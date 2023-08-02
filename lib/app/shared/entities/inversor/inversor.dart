// ignore_for_file: non_constant_identifier_names

import 'package:mobx/mobx.dart';
import 'package:solardino/app/shared/entities/distribuidora/distribuidora.dart';

part 'inversor.g.dart';

class Inversor extends _Inversor with _$Inversor {
  Inversor({int? id, String? item})
      : super(
          id: id,
          item: item,
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "item": item,
    };
  }

  factory Inversor.fromJson(Map json) {
    return Inversor(
      id: json['id'],
      item: json['item'],
    );
  }
}

abstract class _Inversor with Store {
  @observable
  int? id;

  @observable
  String? item;

  @observable
  _Inversor({
    this.id,
    this.item,
  });
}
