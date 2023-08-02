import 'package:solardino/app/modules/home/view/home_page.dart';
import 'package:solardino/app/modules/itens_das_usinas/categoria_dos_itens/view/categoriaDosItens_page.dart';
import 'package:solardino/app/modules/itens_das_usinas/interface/itens_das_usinas_interface.dart';
import 'package:solardino/app/modules/itens_das_usinas/service/itensDasUsinas_service.dart';
import 'package:solardino/app/modules/itens_das_usinas/store/itensDasUsinas_store.dart';
import 'package:solardino/app/modules/login/view/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:solardino/app/modules/login/store/login_store.dart';
import 'package:solardino/app/modules/onboarding_introducao/onboardingIntroducao_page.dart';
import 'package:solardino/app/modules/splash/splash_page.dart';

import '../home/interface/home_interface.dart';
import '../home/service/home_service.dart';
import '../home/store/home_store.dart';
import '../itens_das_usinas/categoria_dos_itens/module/categoriaDosItens_module.dart';
import '../usinas/interface/usinas_interface.dart';
import '../usinas/service/usinas_service.dart';
import '../usinas/store/usinas_store.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeService()),
    Bind((i) => HomeStore(i.get<HomeInterface>())),
    // Load All Modules
    Bind((i) => UsinasService()),
    Bind((i) => UsinasStore(i.get<UsinasInterface>())),

    Bind((i) => ItensDasUsinasService()),
    Bind((i) => ItensDasUsinasStore(i.get<ItensDasUsinasInterface>())),

    Bind((i) => LoginStore()),
    // Bind((i) => CategoriaDosItensStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/login', child: (_, args) => const LoginPage()),
    ChildRoute('/onboarding', child: (_, args) => OnboardingIntro()),
    ChildRoute('/home', child: (_, args) => const HomePage()),
    ChildRoute('/', child: (_, args) => const SplashPage()),
    // ChildRoute('/categoria_dos_itens',
    //     child: (_, args) => CategoriaDosItensPage()),
  ];
}
