// ignore_for_file: non_constant_identifier_names

import 'package:mobx/mobx.dart';

part 'categoria_item.g.dart';

class CategoriaItem extends _CategoriaItem with _$CategoriaItem {
  CategoriaItem({int? id, String? item}) : super(id: id, item: item);

  Map<String, dynamic> toJson() {
    return {"id": id, "item": item};
  }

  factory CategoriaItem.fromJson(Map json) {
    return CategoriaItem(id: json['id'], item: json['item']);
  }
}

abstract class _CategoriaItem with Store {
  @observable
  int? id;

  @observable
  String? item;

  @observable
  _CategoriaItem({this.id, this.item});
}
