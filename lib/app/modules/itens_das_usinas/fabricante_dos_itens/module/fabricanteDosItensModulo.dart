import 'package:flutter_modular/flutter_modular.dart';

import '../store/fabricanteDosItensStore.dart';
import '../view/fabricanteDosItens.dart';

class FabricanteDosItensModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CategoriaDosItensStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => FabricanteDosItensPage()),
  ];
}
