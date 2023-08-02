import 'package:mobx/mobx.dart';

part 'config.g.dart';

class Config extends _Config with _$Config {
  Config({double? irradiacao, double? eficiencia})
      : super(irradiacao: irradiacao, eficiencia: eficiencia);

  Map<String, dynamic> toJson() {
    return {
      "irradiacao": irradiacao,
      "eficiencia": eficiencia,
    };
  }

  factory Config.fromJson(Map json) {
    return Config(
      irradiacao: json['irradiacao'],
      eficiencia: json['eficiencia'],
    );
  }
}

abstract class _Config with Store {
  @observable
  double? irradiacao;
  @observable
  double? eficiencia;

  @observable
  _Config({this.irradiacao, this.eficiencia});
}
