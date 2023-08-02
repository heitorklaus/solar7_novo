import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:solardino/app/modules/home/interface/home_interface.dart';

part 'home_store.g.dart';

@Injectable()
class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  HomeInterface interface;

  @observable
  ObservableFuture? lista;

  @observable
  ObservableFuture? listBuscaPotencia;

  @observable
  ObservableFuture? geracao;

  @observable
  String? modulo = 'teste';

  final search = TextEditingController();

  HomeStoreBase(this.interface) {
    getLista('');
    //changeModulo('/inicio');
    getPotenciaNecessaria(0);

    search.addListener(() {
      getPotenciaNecessaria(search.text);
      getLista(search.text);
    });
  }

  @action
  getPotenciaNecessaria(search) {
    listBuscaPotencia = interface.getPotenciaNecessaria(search).asObservable();
  }

  @action
  Future changeModulo(x) async {
    return x;
  }

  @action
  Future getLista(search) async {
    lista = interface.getLista(search).asObservable().then((value) {
      return value;
    });

    return lista;
  }
}
