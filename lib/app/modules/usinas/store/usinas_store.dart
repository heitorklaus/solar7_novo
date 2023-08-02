import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:solardino/app/modules/usinas/interface/usinas_interface.dart';
import 'package:intl/intl.dart';
import 'package:solardino/app/shared/database_settings/shared_pref_helper.dart';
import 'package:solardino/app/shared/entities/inversor/inversor.dart';
import 'package:solardino/app/shared/entities/item_relacionado/item_relacionado.dart';
import 'package:solardino/app/shared/entities/placasolar/placasolar.dart';
import 'package:solardino/app/shared/entities/usinas/usinas_to_post.dart';

import '../../../shared/dialog/dialog.dart';
part 'usinas_store.g.dart';

class UsinasStore = _UsinasStoreBase with _$UsinasStore;

abstract class _UsinasStoreBase with Store {
  UsinasInterface interface;
  // Tipo de Inversor
  @observable
  TextEditingController tipoDeInversorController = TextEditingController();

  @observable
  String? tipoDeInversor;

  @observable
  int? idTipoDeInversor;

  // Modulos
  @observable
  TextEditingController tipoDeModuloController = TextEditingController();

  @observable
  TextEditingController quantidadeDeModuloController = TextEditingController();

  @observable
  TextEditingController valorDeCustoModuloController =
      TextEditingController(text: "R\$ 0,00");

  @observable
  String? valorPorModulo;

  @observable
  int? idModulo;

  @observable
  String? itemModulo;

  @observable
  String? quantidadeModulo;

  @observable
  double? potenciaDoModulo;

  @observable
  double? valorDeCustoModulo;

  @observable
  double? valorDeVendaModulo;

  // POTENCIA DO SISTEMA
  @observable
  TextEditingController potenciaDoSistemaController = TextEditingController();

  // Itens

  @observable
  List<dynamic>? objetoListaDeItens;

  @observable
  double valorItensSomados = 0;

  @observable
  TextEditingController valorDeCustoDosItens =
      TextEditingController(text: "R\$ 0,00");

  @observable
  dynamic valorDeItens;

  // Servicos Adicionais

  @observable
  TextEditingController valorDeCustoDosServicos =
      TextEditingController(text: "R\$ 0,00");

  @observable
  List<dynamic>? objetoServicosDaLista;

  @observable
  dynamic valorDosServicos;

  @observable
  dynamic valorServicosSomados = 0;

  var formataValor = NumberFormat("#,##0.00", "pt_BR");

  var formataValorIngles = NumberFormat("#,##0.00", "en_US");

  // Custo Total do Sistema
  TextEditingController valorDeCustoTotalDoSistemaController =
      TextEditingController(text: "R\$ 0,00");

  // Custo Total do Sistema
  TextEditingController impostoParaLucroController =
      TextEditingController(text: "0.00");

  @observable
  double valorDeCustoTotalDoSistema = 0;

  @observable
  double impostoParaLucro = 0;

  // LUCRO CONTROLLERS
  // Custo Total do Sistema
  TextEditingController lucroReaisController =
      TextEditingController(text: "R\$ 0,00");

  // Custo Total do Sistema
  TextEditingController lucroPorcentagemController =
      TextEditingController(text: "");

  // Custo Total do Sistema
  TextEditingController valorVendaFinalController =
      TextEditingController(text: "R\$ 0,00");

  @observable
  double? lucroPorcentagemLucroFinal = 0;

  @observable
  double? lucroPorcentagem = 0;

  // ALIAS
  @observable
  TextEditingController aliasController = TextEditingController();

  // ALIAS
  @observable
  TextEditingController geracaoEmKilowatts = TextEditingController();

  @observable
  ObservableFuture? listaUsinaSelecionada;

  BuildContext? dialogContext;

  // Lista de Busca de IDS de ITEM e SERVICO
  @observable
  ObservableFuture? listaDeItensBuscados;

// Lista de  SERVICO
  @observable
  ObservableFuture? listaDeServicosBuscados;

  _UsinasStoreBase(this.interface) {
    quantidadeDeModuloController.addListener(() {
      if (quantidadeDeModuloController.text != '0' &&
          quantidadeDeModuloController.text != '' &&
          idModulo != null) {
        retornaValorDosModulos();
        retornaPotenciaDoSistema();
        // somaValorTotalDeCustos();
      }
    });

    lucroPorcentagemController.addListener(() {
      adicionaLucroAoValorDeCustoFinal();
    });

    impostoParaLucroController.addListener(() {
      if (impostoParaLucroController.text != '0' ||
          impostoParaLucroController.text != '') {
        adicionaImpostoParaCusto();
      }
    });
  }

  // SELECIONA USINA PARA EDITAR
  @action
  Future getIdParaEditarUsina(int id, context) async {
    showDialog(
        // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        context: context,
        builder: (context) {
          dialogContext = context;
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Carregando...'),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       Navigator.of(context).pop();
                  //     },
                  //     child: Text('sss'))
                ],
              ),
            ),
          );
        });
    // Faz a Lista do GET
    listaUsinaSelecionada = interface
        .getUsinaToEdit(id, context)
        .asObservable()
        .then((objetoRetorno) async {
      // Crio o OBJETO
      UsinasToPost? objUsinas = objetoRetorno;

      valorPorModulo = objUsinas?.idPlacasolar!.valor_de_custo.toString();

      if (objUsinas!.inversor!.id != 0) {
        tipoDeInversorController.text = objUsinas.inversor!.item.toString();
        idTipoDeInversor = objUsinas.inversor!.id;
      }

      // Somente resgata se nao for NULO

      // ignore: unrelated_type_equality_checks
      if (objUsinas.idPlacasolar!.id != 0) {
        tipoDeModuloController.text = objUsinas.idPlacasolar!.item.toString();
        idModulo = objUsinas.idPlacasolar!.id;
        quantidadeDeModuloController.text =
            objUsinas.quantidadeDeModulos.toString();
        var valorCustoDosModulos = (formataValor.format(formataValorParaDouble(
                objUsinas.valor_de_custo_todos_modulos.toString()) /
            1000));
        valorDeCustoModuloController.text = 'R\$ ${(valorCustoDosModulos)}';

        potenciaDoSistemaController.text =
            (formataValorParaDouble("${objUsinas.potencia_do_sistema}") / 1000)
                .toString();

        potenciaDoModulo = objUsinas.idPlacasolar!.potencia;

        geracaoEmKilowatts.text = objUsinas.geracao_em_kilowatts.toString();
      }

      var imposto = (formataValor
          .format(formataValorParaDouble(objUsinas.imposto.toString()) / 1000));
      impostoParaLucroController.text = imposto.toString().replaceAll(",", ".");

      var valorCustoDoSistema = (formataValor.format(formataValorParaDouble(
              objUsinas.valor_de_custo_do_sistema.toString()) /
          1000));
      valorDeCustoTotalDoSistemaController.text =
          'R\$ ${(valorCustoDoSistema)}';

      lucroPorcentagemController.text =
          objUsinas.lucro_porcentagem.toString().split(".")[0];

      var valorVendaFinal = (formataValor.format(
          formataValorParaDouble(objUsinas.valor_de_venda_final.toString()) /
              1000));
      valorVendaFinalController.text = 'R\$ ${(valorVendaFinal)}';

      aliasController.text = objUsinas.alias.toString();

      // busca os ids ITENS SE TIVER
      await resgataItens(objUsinas)
          .then((value) => value[0].id == 0 ? value.removeAt(0) : null);

      // busca os ids SERVICOS SE TIVER
      await resgataServicos(objUsinas)
          .then((value) => value[0].id == 0 ? value.removeAt(0) : null);

      Navigator.pop(dialogContext!);
    });
  }

  @action
  Future resgataServicos(objetoServicosDaLista) async {
    var servicos = objetoServicosDaLista.objServicosDasUsinas;

    listaDeServicosBuscados = interface
        .getServicosDaUsina(servicos, context)
        .asObservable()
        .then((value) {
      if (value[0].id != 0) {
        for (var i = 0; i <= value.length - 1; i++) {
          adicionaServicosParaLista(
              "${value[i].id}", "${value[i].qtd}", value[i].valor_de_custo!);
        }
      }

      return value;
    });

    return listaDeServicosBuscados;
  }

  @action
  resgataItens(objUsinas) async {
    var itens = objUsinas.objItensDasUsinas;

    listaDeItensBuscados =
        interface.getItensDaUsina(itens, context).asObservable().then((value) {
      // fazer laco

      if (value[0].id != 0) {
        for (var i = 0; i <= value.length - 1; i++) {
          adicionaItensParaLista(
              "${value[i].id}", "${value[i].qtd}", value[i].valor_de_custo!);
        }
      }

      return value;
    });

    return listaDeItensBuscados;
  }

  @action
  retornaTipoDeInversor(tipoDeInversorSelecionado) {
    var objTipoDeInversor = tipoDeInversorSelecionado;
    idTipoDeInversor = tipoDeInversorSelecionado.id;

    print(tipoDeInversorSelecionado);
  }

  @action
  retornaQuantidadeDeModulo(tipoDeModuloSelecionado) {
    var objetoTipoDeModulo = tipoDeModuloSelecionado;
    quantidadeDeModuloController.text = '0';

    valorPorModulo = objetoTipoDeModulo.valor_de_custo.toString();
    idModulo = objetoTipoDeModulo.id;
    potenciaDoModulo = objetoTipoDeModulo.potencia;

    //ZERA CONTROLLERS
    quantidadeDeModuloController.text = '';

    // ADICIONA A VARIAVEL valorDeCustoTotalDoSistema
    somaValorTotalDeCustos();
  }

  @action
  retornaValorDosModulos() {
    valorDeCustoModuloController.text =
        'R\$ ${multiplicaModuloPorQuantidade(formataValorParaDouble("$valorPorModulo"), formataValorParaDouble(quantidadeDeModuloController.text))}';
  }

  @action
  retornaGeracaoEmKilowatts() {
    var potencia = multiplicaModuloPorQuantidade(
        formataValorParaDouble("$potenciaDoModulo"),
        formataValorParaDouble(quantidadeDeModuloController.text) / 1000);

    var irradiacao = 5.11;
    var eficiencia = .75;

    var resultado =
        ((formataValorParaDouble(potencia) * 30 * irradiacao * eficiencia) /
            1000);

    geracaoEmKilowatts.text =
        formataValor.format(resultado * 10).toString() + ' kWh';
  }

  @action
  retornaPotenciaDoSistema() {
    if (potenciaDoModulo != null) {
      potenciaDoSistemaController.text = multiplicaModuloPorQuantidade(
              formataValorParaDouble("$potenciaDoModulo"),
              formataValorParaDouble(quantidadeDeModuloController.text) / 1000)
          .toString();
      retornaGeracaoEmKilowatts();
    }
  }

  @action
  double formataValorParaDouble(String valor) {
    var valorNovo = valor
                .replaceAll(",", "")
                .replaceAll(".", "")
                .replaceAll("R\$ ", "") ==
            ''
        ? '0.0'
        : valor.replaceAll(",", "").replaceAll(".", "").replaceAll("R\$ ", "");

    return double.parse(valorNovo);
  }

  @action
  String multiplicaModuloPorQuantidade(
      double valorDoItenModulo, double quantidade) {
    var formataValor = NumberFormat("#,##0.00", "pt_BR");
    var valor = (valorDoItenModulo * quantidade / 10);

    return formataValor.format(valor).toString();
  }

  @action
  String multiplicaItemPorQuantidadeRetornoEmReais(
      double valorDoItem, double quantidade) {
    var valor = (valorDoItem * quantidade);

    return formataValor.format(valor).toString();
  }

  @action
  String multiplicaItemPorQuantidadeRetornoEmDouble(
      double valorDoItem, double quantidade) {
    var valor = (valorDoItem * quantidade);

    return formataValorIngles.format(valor).toString();
  }

  @action
  String multiplicaItemPorQuantidadeRetornoLImpo(
      double valorDoItem, double quantidade) {
    var valor = (valorDoItem * quantidade);

    return valor.toString();
  }

  @action
  String formataValorParaReais(String valor) {
    var valorNovo =
        valor.replaceAll(",", "").replaceAll(".", "").replaceAll("R\$ ", "");

    return formataValor.format(valorNovo);
  }

  @action
  adicionarNovo(String idItem, String quantidade, double valorDeCusto) {
    valorDeCustoDosItens.text = "R\$";
  }

  @action
  adicionaItensParaLista(
      String idItem, String quantidade, double valorDeCusto) {
    objetoListaDeItens ??= [];
    if (quantidade == "null") quantidade = "1";
    print(objetoListaDeItens);
    objetoListaDeItens?.add("$idItem:$quantidade:$valorDeCusto");

    valorDeItens = multiplicaItemPorQuantidadeRetornoEmDouble(
        valorDeCusto, double.parse(quantidade));

    valorItensSomados +=
        double.parse(valorDeItens.toString().replaceAll(",", ""));

    valorDeCustoDosItens.text = "R\$ ${formataValor.format(valorItensSomados)}";

    print(objetoListaDeItens);
    somaValorTotalDeCustos();
  }

  @action
  adicionaServicosParaLista(
      String idItem, String quantidade, double valorDeCusto) {
    objetoServicosDaLista ??= [];
    if (quantidade == "null") quantidade = "1";
    print(objetoServicosDaLista);
    objetoServicosDaLista?.add("$idItem:$quantidade:$valorDeCusto");

    valorDosServicos = multiplicaItemPorQuantidadeRetornoEmDouble(
        valorDeCusto, double.parse(quantidade));

    valorServicosSomados +=
        double.parse(valorDosServicos.toString().replaceAll(",", ""));

    valorDeCustoDosServicos.text =
        "R\$ ${formataValor.format(valorServicosSomados)}";

    print(objetoServicosDaLista);
    somaValorTotalDeCustos();
    adicionaImpostoParaCusto();
  }

  @action
  atualizaItensDaLista(dynamic itemToUpdate) {
    var splitar = itemToUpdate
        .toString()
        .replaceAll("{", "")
        .replaceAll("}", "")
        .replaceAll("'", "")
        .split("/");
    // The string that we want to replce
    // ignore: iterable_contains_unrelated_type
    objetoListaDeItens!.contains(splitar[0])
        ? objetoListaDeItens![
            objetoListaDeItens!.indexWhere((v) => v == splitar[0])] = splitar[1]
        : objetoListaDeItens;

    print(objetoListaDeItens);

    atualizaTodosOsValoresDosItens(objetoListaDeItens);
  }

  @action
  atualizaTodosOsValoresDosItens(objAtualizarItens) {
    valorDeCustoDosItens.text = '';
    double novoValorDeItens = 0;

    for (var i = 0; i <= objAtualizarItens.length - 1; i++) {
      var valor_de_custo = objAtualizarItens[i].toString().split(":")[2];
      var quantidade = objAtualizarItens[i].toString().split(":")[1];
      var id_do_item = objAtualizarItens[i].toString().split(":")[0];

      novoValorDeItens += double.parse(multiplicaItemPorQuantidadeRetornoLImpo(
          double.parse(valor_de_custo), double.parse(quantidade)));
    }
    double valor = (novoValorDeItens);

    valorDeCustoDosItens.text = "R\$ ${formataValor.format(valor)}";
    somaValorTotalDeCustos();
  }

  @action
  removeItensDaLista(int itemToRemove) {
    var splitar = objetoListaDeItens?[itemToRemove].toString().split(":");
    var valor_para_subtrair = splitar?[2];
    var qtd = double.parse(splitar![1]);
    valorItensSomados -= (double.parse(valor_para_subtrair!) * qtd);

    print(objetoListaDeItens);
    objetoListaDeItens?.removeAt(itemToRemove);
    print(objetoListaDeItens);
    valorDeCustoDosItens.text = "R\$ ${formataValor.format(valorItensSomados)}";
    somaValorTotalDeCustos();
  }

  @action
  removeServicosDaLista(int servicoToRemove) {
    var splitar = objetoServicosDaLista?[servicoToRemove].toString().split(":");
    var valor_para_subtrair = splitar?[2];
    var qtd = double.parse(splitar![1]);
    valorServicosSomados -= (double.parse(valor_para_subtrair!) * qtd);

    print(objetoServicosDaLista);
    objetoServicosDaLista?.removeAt(servicoToRemove);
    print(objetoServicosDaLista);
    valorDeCustoDosServicos.text =
        "R\$ ${formataValor.format(valorServicosSomados)}";
    somaValorTotalDeCustos();
  }

  @action
  atualizaServicosDaLista(dynamic servicoToUpdate) {
    var splitar = servicoToUpdate
        .toString()
        .replaceAll("{", "")
        .replaceAll("}", "")
        .replaceAll("'", "")
        .split("/");
    // The string that we want to replce
    // ignore: iterable_contains_unrelated_type
    objetoServicosDaLista!.contains(splitar[0])
        ? objetoServicosDaLista![objetoServicosDaLista!
            .indexWhere((v) => v == splitar[0])] = splitar[1]
        : objetoServicosDaLista;

    print(objetoServicosDaLista);

    atualizaTodosOsValoresDosServicos(objetoServicosDaLista);
    somaValorTotalDeCustos();
    adicionaImpostoParaCusto();
  }

  @action
  atualizaTodosOsValoresDosServicos(objAtualizarServicos) {
    valorDeCustoDosServicos.text = '';
    double novoValorDeServicos = 0;

    for (var i = 0; i <= objAtualizarServicos.length - 1; i++) {
      var valor_de_custo = objAtualizarServicos[i].toString().split(":")[2];
      var quantidade = objAtualizarServicos[i].toString().split(":")[1];
      var id_do_item = objAtualizarServicos[i].toString().split(":")[0];

      novoValorDeServicos += double.parse(
          multiplicaItemPorQuantidadeRetornoLImpo(
              double.parse(valor_de_custo), double.parse(quantidade)));
    }
    double valor = (novoValorDeServicos);

    valorDeCustoDosServicos.text = "R\$ ${formataValor.format(valor)}";
  }

  @action
  somaValorTotalDeCustos() {
    valorDeCustoTotalDoSistema = 0;
    var custoModulos =
        formataValorParaDouble(valorDeCustoModuloController.text);
    var custoItens = formataValorParaDouble(valorDeCustoDosItens.text);
    var custoServicos = formataValorParaDouble(valorDeCustoDosServicos.text);

    valorDeCustoTotalDoSistema += (custoModulos + custoItens + custoServicos);
    valorDeCustoTotalDoSistemaController.text =
        'R\$ ${formataValor.format(valorDeCustoTotalDoSistema / 100)}';
    adicionaImpostoParaCusto();
  }

  @action
  adicionaImpostoParaCusto() {
    impostoParaLucro = formataValorParaDouble(impostoParaLucroController.text);

    var somarAoCusto =
        ((impostoParaLucro / 10000) * valorDeCustoTotalDoSistema);

    var valorSomado =
        double.parse((valorDeCustoTotalDoSistema + somarAoCusto).toString())
            .toString();

    valorDeCustoTotalDoSistemaController.text =
        "R\$ ${formataValor.format(double.parse(valorSomado) / 100)}";
    adicionaLucroAoValorDeCustoFinal();
  }

  @action
  adicionaLucroAoValorDeCustoFinal() {
    lucroPorcentagemLucroFinal =
        formataValorParaDouble(valorDeCustoTotalDoSistemaController.text);

    lucroPorcentagem = formataValorParaDouble(lucroPorcentagemController.text);

    var valorDeCustoDoSistema =
        formataValorParaDouble(valorDeCustoTotalDoSistemaController.text);

    var t;

    t = (lucroPorcentagem! /
        100 *
        formataValorParaDouble(valorDeCustoTotalDoSistemaController.text) /
        100);

    // ASSOCIAR AO LUCRO TRANSCRITO
    var lucroTranscritoEmReais = "R\$ ${formataValor.format(t).toString()}";
    lucroReaisController.text = lucroTranscritoEmReais;

    var lucroSomadoDoCustoElucroTranscrito = (double.parse(
            formataValorParaDouble(lucroTranscritoEmReais).toString()) +
        valorDeCustoDoSistema);

    valorVendaFinalController.text =
        "R\$ ${formataValor.format(lucroSomadoDoCustoElucroTranscrito / 100).toString()}";
  }

  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  @action
  Future montarUsinaParaEnviar(context, id) async {
    if (idModulo == null &&
        objetoListaDeItens == null &&
        objetoServicosDaLista == null) {
      showDialog(
          context: context,
          barrierColor: Color.fromARGB(174, 0, 0, 0),
          builder: (BuildContext context) => DialogClass(
                dialogType: 'formularioInvalidoDaUsina',
                message:
                    '- Escolha  uma quantidade de módulos,ou itens ou serviços',
              ));
    } else if (idModulo != null && quantidadeDeModuloController.text == '') {
      showDialog(
          context: context,
          barrierColor: Color.fromARGB(174, 0, 0, 0),
          builder: (BuildContext context) => DialogClass(
                dialogType: 'formularioInvalidoDaUsina',
                message: '- Informe uma quantidade de módulos',
              ));
    } else if (aliasController.text == '') {
      showDialog(
          context: context,
          barrierColor: Color.fromARGB(174, 0, 0, 0),
          builder: (BuildContext context) => DialogClass(
                dialogType: 'formularioInvalidoDaUsina',
                message: '- Informe um nome de identificação',
              ));
    } else {
      UsinasToPost usinasToPost = UsinasToPost();
      var dialogContext = context;

// MONTO O OBJETO DE ENVIO
      usinasToPost.inversor =
          idTipoDeInversor == null ? null : Inversor(id: idTipoDeInversor);
      usinasToPost.idPlacasolar =
          idModulo == null ? null : PlacaSolar(id: idModulo);
      usinasToPost.quantidadeDeModulos = int.parse(
          quantidadeDeModuloController.text == ""
              ? "0"
              : quantidadeDeModuloController.text);
      usinasToPost.valor_de_custo_todos_modulos =
          formataValorParaDouble(valorDeCustoModuloController.text);
      usinasToPost.potencia_do_sistema =
          formataValorParaDouble(potenciaDoSistemaController.text);

      if (objetoListaDeItens != null) {
        if (objetoListaDeItens!.length == 0) {
          usinasToPost.objItensDasUsinas = null;
        } else {
          usinasToPost.objItensDasUsinas = objetoListaDeItens?.join('/');
        }
      }

      if (objetoServicosDaLista != null) {
        if (objetoServicosDaLista!.length == 0) {
          usinasToPost.objServicosDasUsinas = null;
        } else {
          usinasToPost.objServicosDasUsinas = objetoServicosDaLista?.join('/');
        }
      }

      usinasToPost.idCodigoDaUsina = generateRandomString(15).toUpperCase();
      usinasToPost.imposto = impostoParaLucro;
      usinasToPost.valor_de_custo_do_sistema =
          formataValorParaDouble(valorDeCustoTotalDoSistemaController.text);
      usinasToPost.lucro_porcentagem = lucroPorcentagem;
      usinasToPost.lucro_reais =
          formataValorParaDouble(lucroReaisController.text);
      usinasToPost.valor_de_venda_final =
          formataValorParaDouble(valorVendaFinalController.text);
      usinasToPost.alias = aliasController.text;

      usinasToPost.geracao_em_kilowatts = geracaoEmKilowatts.text;

// id = 0 SIGNIFICA CADASTRO NOVO
      if (id == 0) {
        interface
            .cadastrarNovaUsina(usinasToPost, dialogContext)
            .asObservable()
            .then((value) {
          if (value.statusCode == 200) {
            var x = showDialog(
                context: dialogContext,
                barrierColor: Color.fromARGB(174, 0, 0, 0),
                builder: (BuildContext context) => DialogClass(
                      dialogType: 'sucessPostInsert',
                      message: 'teste',
                    )).then((valueFromDialog) {
              // use the value as you wish
              //  Modular.to.pushNamedAndRemoveUntil('/usinas', (p0) => true);
              if (valueFromDialog == 'irParaInicio') {
                Navigator.pop(context, valueFromDialog); //
              }
              if (valueFromDialog == 'novoCadastro') {
                Navigator.pop(context, valueFromDialog); //
              }
            });
          } else {
            showDialog(
                context: context,
                barrierColor: Color.fromARGB(174, 0, 0, 0),
                builder: (BuildContext context) => DialogClass(
                      dialogType: 'formularioInvalidoDaUsina',
                      message: 'value',
                    ));
          }
          return ScaffoldMessenger.of(context).hideCurrentSnackBar();
        });
      } else // SE NAO  ATUALIZANDO
      {
        interface
            .alterarUsina(id, usinasToPost, dialogContext)
            .asObservable()
            .then((value) {
          if (value.statusCode == 200) {
            var x = showDialog(
                context: dialogContext,
                barrierColor: Color.fromARGB(174, 0, 0, 0),
                builder: (BuildContext context) => DialogClass(
                      dialogType: 'sucessPostUpdated',
                      message: 'teste',
                    )).then((valueFromDialog) {
              // use the value as you wish

              Modular.to.pop();
            });
          } else {
            showDialog(
                context: context,
                barrierColor: Color.fromARGB(174, 0, 0, 0),
                builder: (BuildContext context) => DialogClass(
                      dialogType: 'formularioInvalidoDaUsina',
                      message: 'value',
                    ));
          }
          return ScaffoldMessenger.of(context).hideCurrentSnackBar();
        });
      }
    }
  }

  @action
  novoCadastro() {
    Modular.to.pushReplacementNamed('/usinas');
  }
}
