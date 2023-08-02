import 'package:mobx/mobx.dart';
import 'package:solardino/app/modules/itens_das_usinas/categoria_dos_itens/module/categoriaDosItens_module.dart';
import 'package:solardino/app/modules/itens_das_usinas/interface/itens_das_usinas_interface.dart';
import 'package:solardino/app/modules/itens_das_usinas/store/itensDasUsinas_store.dart';
import 'package:solardino/app/modules/itens_das_usinas/view/itensDasUsinas_page.dart';
import 'package:solardino/app/modules/usinas/interface/usinas_interface.dart';
import 'package:solardino/app/modules/usinas/view/usinas_Page.dart';
import 'package:solardino/app/modules/usinas/store/usinas_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:solardino/app/shared/entities/usinas/usinas.dart';

import '../categoria_dos_itens/store/categoriaDosItens_store.dart';

class ItensDasUsinasModule extends Module {
  late ObservableStream<Usinas> usinas;

  @override
  final List<Bind> binds = [
    Bind(
      (i) => ItensDasUsinasStore(i.get<ItensDasUsinasInterface>()),
    ),
    Bind((i) => CategoriaDosItensStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ItensDasUsinas()),
    ModuleRoute('/categoria_dos_itens', module: CategoriaDosItensModule()),
  ];
}
