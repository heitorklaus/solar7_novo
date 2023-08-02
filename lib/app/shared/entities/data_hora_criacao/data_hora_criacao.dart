import 'package:mobx/mobx.dart';

part 'data_hora_criacao.g.dart';

class DataHoraCriacao extends _DataHoraCriacao with _$DataHoraCriacao {
  // ignore: non_constant_identifier_names
  DataHoraCriacao({int? dia, int? mes, int? ano})
      : super(dia: dia, mes: mes, ano: ano);

  Map<String, dynamic> toJson() {
    return {"dia": dia, "mes": mes, "id_seranovicos_qtd": ano};
  }

  factory DataHoraCriacao.fromJson(Map json) {
    return DataHoraCriacao(
        dia: json['dayOfMonth'], mes: json['monthValue'], ano: json['year']);
  }
}

abstract class _DataHoraCriacao with Store {
  @observable
  int? dia;
  @observable
  int? mes;
  @observable
  int? ano;

  @observable
  // ignore: non_constant_identifier_names
  _DataHoraCriacao({this.dia, this.mes, this.ano});
}
