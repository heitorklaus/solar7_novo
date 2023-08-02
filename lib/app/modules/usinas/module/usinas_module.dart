import 'package:mobx/mobx.dart';
import 'package:solardino/app/modules/usinas/interface/usinas_interface.dart';
import 'package:solardino/app/modules/usinas/view/usinas_Page.dart';
import 'package:solardino/app/modules/usinas/store/usinas_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:solardino/app/shared/entities/usinas/usinas.dart';

class UsinasModule extends Module {
  late ObservableStream<Usinas> usinas;

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UsinasStore(i.get<UsinasInterface>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => UsinasPage()),
  ];
}
