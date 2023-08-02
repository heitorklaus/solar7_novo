import 'package:flutter_modular/flutter_modular.dart';
import 'package:solardino/app/modules/home/interface/home_interface.dart';
import 'package:solardino/app/modules/home/service/home_service.dart';
import 'package:solardino/app/modules/itens_das_usinas/categoria_dos_itens/view/categoriaDosItens_page.dart';
import 'package:solardino/app/modules/usinas/interface/usinas_interface.dart';
import 'package:solardino/app/modules/usinas/service/usinas_service.dart';
import 'package:solardino/app/modules/usinas/store/usinas_store.dart';
import '../../itens_das_usinas/categoria_dos_itens/module/categoriaDosItens_module.dart';
import '../store/home_store.dart';

import '../view/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/home', child: (_, args) => const HomePage()),
    ChildRoute('/categoria_dos_itens',
        child: (_, args) => const CategoriaDosItens()),
  ];
}
