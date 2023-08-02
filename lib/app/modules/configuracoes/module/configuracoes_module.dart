import 'package:solardino/app/modules/configuracoes/view/configuracoes_page.dart';
import 'package:solardino/app/modules/configuracoes/store/configuracoes_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:solardino/app/modules/itens_das_usinas/store/itensDasUsinas_store.dart';

import '../../itens_das_usinas/categoria_dos_itens/module/categoriaDosItens_module.dart';

class ConfiguracoesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ConfiguracoesStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ConfiguracoesPage()),
    ModuleRoute('/categoria_dos_itens', module: CategoriaDosItensModule()),
  ];
}
