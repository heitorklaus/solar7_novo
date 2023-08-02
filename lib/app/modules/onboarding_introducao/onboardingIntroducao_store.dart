// ignore_for_file: file_names

import 'package:mobx/mobx.dart';
import 'package:solardino/app/modules/onboarding_introducao/entities/config.dart';

import '../../shared/database_settings/initialization_helper.dart';
import '../../shared/database_settings/shared_pref_helper.dart';

part 'onboardingIntroducao_store.g.dart';

class OnboardingIntroducaoStore = _OnboardingIntroducaoStoreBase
    with _$OnboardingIntroducaoStore;

abstract class _OnboardingIntroducaoStoreBase with Store {
  final db = InitializationHelper.getInstance().db;

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  resgate() async {
    final dbClient = await db;
    final q = await dbClient?.rawQuery('select * from CONFIG');
    final valor = Config.fromJson(q!.first);

    Prefs.setString('efici', valor.eficiencia.toString());
    Prefs.setString('irradiacao', valor.irradiacao.toString());
//
    return valor;
  }
}
