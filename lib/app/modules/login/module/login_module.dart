import 'package:solardino/app/modules/home/view/home_page.dart';
import 'package:solardino/app/modules/login/interface/login_interface.dart';
import 'package:solardino/app/modules/login/view/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:solardino/app/modules/login/store/login_store.dart';

import '../../home/interface/home_interface.dart';
import '../../home/service/home_service.dart';
import '../../home/store/home_store.dart';
import '../../usinas/interface/usinas_interface.dart';
import '../../usinas/service/usinas_service.dart';
import '../../usinas/store/usinas_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeService()),
    Bind((i) => HomeStore(i.get<HomeInterface>())),

    Bind.lazySingleton((i) => LoginModule()),

    // Load All Modules
    Bind((i) => UsinasService()),
    Bind((i) => UsinasStore(i.get<UsinasInterface>())),

    Bind((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/home', child: (_, args) => const HomePage()),
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
