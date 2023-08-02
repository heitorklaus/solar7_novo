// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:solardino/app/modules/usinas/module/usinas_module.dart';

// import 'modules/home/module/home_module.dart';
// import 'modules/onboarding_introducao/onboardingIntroducao_module.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;

// class AppModule extends Module {
//   @override
//   final List<Bind> binds = [Bind.lazySingleton((i) => MyStoreStore()),];

//   @override
//   final List<ModularRoute> routes = [
//     ModuleRoute(kIsWeb ? '/home' : Modular.initialRoute,
//         module: kIsWeb ? HomeModule() : OnboardingIntroducaoModule()),
//     ModuleRoute(kIsWeb ? Modular.initialRoute : '/home', module: HomeModule()),
//     ModuleRoute('/usinas', module: UsinasModule()),
//   ];
// }

import 'package:flutter_modular/flutter_modular.dart';
import 'package:solardino/app/modules/configuracoes/module/configuracoes_module.dart';
import 'package:solardino/app/modules/itens_das_usinas/distribuidor_dos_itens/module/distribuidorDosItensModule.dart';
import 'package:solardino/app/modules/itens_das_usinas/fabricante_dos_itens/module/fabricanteDosItensModulo.dart';
import 'package:solardino/app/modules/itens_das_usinas/module/itensDasUsinas_module.dart';
import 'package:solardino/app/modules/login/module/login_module.dart';
import 'package:solardino/app/modules/splash/splash_module.dart';

import 'modules/home/module/home_module.dart';
import 'modules/itens_das_usinas/categoria_dos_itens/module/categoriaDosItens_module.dart';
import 'modules/itens_das_usinas/interface/itens_das_usinas_interface.dart';
import 'modules/itens_das_usinas/store/itensDasUsinas_store.dart';
import 'modules/usinas/module/usinas_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/usinas', module: UsinasModule()),
    ModuleRoute('/configuracoes', module: ConfiguracoesModule()),
    ModuleRoute('/itens_das_usinas', module: ItensDasUsinasModule()),
    ModuleRoute('/categoria_dos_itens', module: CategoriaDosItensModule()),
    ModuleRoute('/fabricante_dos_itens', module: FabricanteDosItensModule()),
    ModuleRoute('/distribuidor_dos_itens',
        module: DistribuidorDosItensModule()),
  ];
}
