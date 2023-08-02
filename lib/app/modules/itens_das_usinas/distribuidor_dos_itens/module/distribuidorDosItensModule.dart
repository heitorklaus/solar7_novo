import 'package:flutter_modular/flutter_modular.dart';

import '../store/distribuidorDosItensStore.dart';
import '../view/distribuidorDosItens.dart';

class DistribuidorDosItensModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CategoriaDosItensStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => DistribuidorDosItensPage()),
  ];
}
