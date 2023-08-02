// ignore_for_file: file_names

import 'package:solardino/app/modules/onboarding_introducao/onboardingIntroducao_Page.dart';
import 'package:solardino/app/modules/onboarding_introducao/onboardingIntroducao_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnboardingIntroducaoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => OnboardingIntroducaoStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => OnboardingIntro()),
  ];
}
