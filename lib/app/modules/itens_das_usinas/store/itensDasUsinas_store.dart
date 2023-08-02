import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
import 'package:solardino/app/shared/entities/usinas/usinas_to_post.dart';

import '../interface/itens_das_usinas_interface.dart';
part 'itensDasUsinas_store.g.dart';

class ItensDasUsinasStore = _ItensDasUsinasStoreBase with _$ItensDasUsinasStore;

abstract class _ItensDasUsinasStoreBase with Store {
  ItensDasUsinasInterface interface;

  @observable
  TextEditingController search = TextEditingController();
  @observable
  ObservableFuture? listaDeItens;

  @observable
  TextEditingController tipoDeModuloController = TextEditingController();

  Future changeModulo(c) async {
    return c;
  }

  Future getListaDeItens(busca, context) async {
    listaDeItens =
        interface.getListaDeItens(busca, context).asObservable().then((value) {
      return value;
    });
  }

  // Tipo de Inversor
  @observable
  TextEditingController tipoDeInversorController = TextEditingController();

  // Lista de Busca de IDS de ITEM e SERVICO
  @observable
  ObservableFuture? listaDeItensBuscados;

// Lista de  SERVICO
  @observable
  ObservableFuture? listaDeServicosBuscados;

  _ItensDasUsinasStoreBase(this.interface) {
    getListaDeItens('', context);
  }
}
