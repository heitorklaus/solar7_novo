import 'package:flutter_modular/flutter_modular.dart';

import '../store/categoriaDosItens_store.dart';
import '../view/categoriaDosItens_page.dart';

class CategoriaDosItensModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CategoriaDosItensStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CategoriaDosItens()),
  ];
}
