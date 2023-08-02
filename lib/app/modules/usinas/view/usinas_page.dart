// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:solardino/app/modules/usinas/store/usinas_store.dart';

import '../../../shared/responsive/constants.dart';

import '../../../shared/widgets/autocomplete/autocomplete_service.dart';
import '../../../shared/widgets/autocomplete/autocomplete_widget.dart';
import '../../../shared/widgets/autocomplete/widget_search_list.dart';

class UsinasPage extends StatefulWidget {
  UsinasPage({Key? key, String? valor}) : super(key: key);

  @override
  State<UsinasPage> createState() => _UsinasPageState();
}

class _UsinasPageState extends State<UsinasPage> {
  // A>A>A
  //
  UsinasStore controllerUsinaStore = Modular.get<UsinasStore>();
  ScrollController scrollController = ScrollController();

  void returnScroll(double x) {
    scrollController.animateTo(x,
        curve: Curves.easeOut, duration: const Duration(milliseconds: 300));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // {seleciona id}
    Map? arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    int id = int.parse(arguments?['id'] == null ? '0' : '${arguments?['id']}');

    Future.delayed(Duration.zero, () {
      // ignore: unrelated_type_equality_checks
      if (id != 0) Modular.get<UsinasStore>().getIdParaEditarUsina(id, context);
    });

    _willPopCallback() async {
      Modular.to.pop();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0))),
        backgroundColor: Constants.corPrimaria,
        title: Row(
          children: [
            Text(
              'Nova usina',
              style: Constants.textTitlePages.copyWith(fontSize: 18),
            ),
          ],
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white),
            onPressed: () {
              _willPopCallback();
            }),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Tipo de inversor',
                  textAlign: TextAlign.left,
                  style: Constants.textToFormFieldsINPUT,
                ),
              ),
              Container(
                child: AutoCompleteWidget(
                  getListaData: AutoCompleteService.getTipoDeInversor,
                  controller: controllerUsinaStore.tipoDeInversorController,
                  onSelect: (resultadoSelecionado) {
                    controllerUsinaStore
                        .retornaTipoDeInversor(resultadoSelecionado);
                  },
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Tipo de módulo',
                  textAlign: TextAlign.left,
                  style: Constants.textToFormFieldsINPUT,
                ),
              ),
              Container(
                child: AutoCompleteWidget(
                  getListaData: AutoCompleteService.getTipoModulo,
                  controller: controllerUsinaStore.tipoDeModuloController,
                  onSelect: (resultadoSelecionado) {
                    controllerUsinaStore
                        .retornaQuantidadeDeModulo(resultadoSelecionado);
                  },
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Quantidade de módulo',
                  textAlign: TextAlign.left,
                  style: Constants.textToFormFieldsINPUT,
                ),
              ),
              Observer(builder: (BuildContext context) {
                return TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (val) {},
                  controller: controllerUsinaStore.quantidadeDeModuloController,
                  onTap: () {},
                  style: Constants.textToFormFields,
                );
              }),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Valor dos Módulos',
                  textAlign: TextAlign.left,
                  style: Constants.textToFormFieldsINPUT,
                ),
              ),
              Observer(builder: (BuildContext context) {
                return TextFormField(
                  controller: controllerUsinaStore.valorDeCustoModuloController,
                  onTap: () {},
                  style: Constants.textToFormFields,
                );
              }),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Potencia do Sistema',
                  textAlign: TextAlign.left,
                  style: Constants.textToFormFieldsINPUT,
                ),
              ),
              Observer(builder: (BuildContext context) {
                return TextFormField(
                  controller: controllerUsinaStore.potenciaDoSistemaController,
                  onTap: () {},
                  style: Constants.textToFormFields,
                );
              }),
              SizedBox(
                height: 22,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Geração do Sistema',
                  textAlign: TextAlign.left,
                  style: Constants.textToFormFieldsINPUT,
                ),
              ),
              Observer(builder: (BuildContext context) {
                return TextFormField(
                  controller: controllerUsinaStore.geracaoEmKilowatts,
                  onTap: () {},
                  style: Constants.textToFormFields,
                );
              }),
              SizedBox(
                height: 22,
              ),
              if (arguments?['id'] != null)
                Card(
                  color: Color.fromARGB(246, 252, 251, 251),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 0.0, right: 0, top: 12),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(top: 0),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Row(
                              children: [
                                Icon(Icons.important_devices_sharp,
                                    size: 20, color: Constants.corPrimaria),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Itens da usina',
                                  textAlign: TextAlign.left,
                                  style: Constants.textToFormFieldsINPUT,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Observer(builder: (BuildContext context) {
                          List<dynamic>? listItem = [];
                          listItem =
                              controllerUsinaStore.listaDeItensBuscados?.value;

                          if (listItem == null) {
                            return Container(
                              width: 30,
                              height: 78,
                              padding: EdgeInsets.only(bottom: 25, top: 25),
                              child: const CircularProgressIndicator(
                                color: Constants.corPrimaria,
                                strokeWidth: 2,
                              ),
                            );
                          } else {
                            // controllerUsinaStore.adicionaItensParaLista(
                            //     "${list.first.id}",
                            //     "${list.first.qtd}",
                            //     list.first.valor_de_custo!);

                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, right: 12),
                              child: WidgetSearchList(
                                  getListaFrom: AutoCompleteService.getItens,
                                  onChange: (x) {
                                    controllerUsinaStore
                                        .atualizaItensDaLista(x);
                                  },
                                  getFromUpdate: listItem,
                                  onSelect: (s) {
                                    // Adicionar a Lista id:qtd:valor_de_custo
                                    controllerUsinaStore.adicionaItensParaLista(
                                        "${s.id}",
                                        "${s.qtd}",
                                        s.valor_de_custo);
                                  },
                                  onTap: () {
                                    returnScroll(600);
                                  },
                                  onPressed: (a) {
                                    controllerUsinaStore.removeItensDaLista(a);
                                  },
                                  onClickViewDetail: (a) {},
                                  onChanged: (a) {}),
                            );
                          }
                          return SizedBox();
                        }),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixText: 'Valor de custo dos itens'),
                            textAlign: TextAlign.right,
                            controller:
                                controllerUsinaStore.valorDeCustoDosItens,
                            onTap: () {},
                            style: Constants.textToFormFields.copyWith(
                              fontSize: 13,
                            ),
                            inputFormatters: <TextInputFormatter>[
                              CurrencyTextInputFormatter(
                                locale: 'pt_BR',
                                customPattern: "R\$ #,##0.00",
                                decimalDigits: 2,
                              )
                            ],
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ),
              if (arguments?['id'] == null)
                Card(
                  color: Color.fromARGB(246, 252, 251, 251),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 0.0, right: 0, top: 12),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(top: 0),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Row(
                              children: [
                                Icon(Icons.important_devices_sharp,
                                    size: 20, color: Constants.corPrimaria),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Itens da usina',
                                  textAlign: TextAlign.left,
                                  style: Constants.textToFormFieldsINPUT,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, right: 12),
                          child: WidgetSearchList(
                              getListaFrom: AutoCompleteService.getItens,
                              onChange: (x) {
                                controllerUsinaStore.atualizaItensDaLista(x);
                              },
                              onSelect: (s) {
                                // Adicionar a Lista id:qtd:valor_de_custo
                                controllerUsinaStore.adicionaItensParaLista(
                                    "${s.id}", "${s.qtd}", s.valor_de_custo);
                              },
                              onTap: () {
                                returnScroll(600);
                              },
                              onPressed: (a) {
                                controllerUsinaStore.removeItensDaLista(a);
                              },
                              onClickViewDetail: (a) {},
                              onChanged: (a) {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixText: 'Valor de custo dos itens'),
                            textAlign: TextAlign.right,
                            controller:
                                controllerUsinaStore.valorDeCustoDosItens,
                            onTap: () {},
                            style: Constants.textToFormFields.copyWith(
                              fontSize: 13,
                            ),
                            inputFormatters: <TextInputFormatter>[
                              CurrencyTextInputFormatter(
                                locale: 'pt_BR',
                                customPattern: "R\$ #,##0.00",
                                decimalDigits: 2,
                              )
                            ],
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ),
              SizedBox(
                height: 15,
              ),
              if (arguments?['id'] != null)
                Card(
                  color: Color.fromARGB(246, 252, 251, 251),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 0.0, right: 0, top: 12),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(top: 0),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Row(
                              children: [
                                Icon(Icons.supervised_user_circle,
                                    size: 20, color: Constants.corPrimaria),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Serviços adicionais',
                                  textAlign: TextAlign.left,
                                  style: Constants.textToFormFieldsINPUT,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Observer(builder: (BuildContext context) {
                          List<dynamic>? listServico = [];
                          listServico = controllerUsinaStore
                              .listaDeServicosBuscados?.value;

                          if (listServico == null) {
                            return Container(
                              width: 30,
                              height: 78,
                              padding: EdgeInsets.only(bottom: 25, top: 25),
                              child: const CircularProgressIndicator(
                                color: Constants.corPrimaria,
                                strokeWidth: 2,
                              ),
                            );
                          } else {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 13, right: 13),
                              child: WidgetSearchList(
                                  getFromUpdate: listServico,
                                  getListaFrom:
                                      AutoCompleteService.getServicosAdicionais,
                                  onChange: (x) {
                                    controllerUsinaStore
                                        .atualizaServicosDaLista(x);
                                  },
                                  onSelect: (s) {
                                    // Adicionar a Lista id:qtd:valor_de_custo
                                    controllerUsinaStore
                                        .adicionaServicosParaLista("${s.id}",
                                            "${s.qtd}", s.valor_de_custo);
                                  },
                                  onTap: () {
                                    returnScroll(800);
                                  },
                                  onPressed: (a) => controllerUsinaStore
                                      .removeServicosDaLista(a),
                                  onClickViewDetail: (a) {},
                                  onChanged: (a) {}),
                            );
                          }
                          return SizedBox();
                        }),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Observer(builder: (BuildContext context) {
                            return TextFormField(
                              decoration: InputDecoration(
                                  prefixText: 'Valor de serviços dos itens'),
                              textAlign: TextAlign.right,
                              controller:
                                  controllerUsinaStore.valorDeCustoDosServicos,
                              onTap: () {},
                              style: Constants.textToFormFields
                                  .copyWith(fontSize: 13),
                              inputFormatters: <TextInputFormatter>[
                                CurrencyTextInputFormatter(
                                  locale: 'pt_BR',
                                  customPattern: "R\$ #,##0.00",
                                  decimalDigits: 2,
                                )
                              ],
                              keyboardType: TextInputType.number,
                            );
                          }),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              if (arguments?['id'] == null)
                Card(
                  color: Color.fromARGB(246, 252, 251, 251),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 0.0, right: 0, top: 12),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(top: 0),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Row(
                              children: [
                                Icon(Icons.supervised_user_circle,
                                    size: 20, color: Constants.corPrimaria),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Serviços adicionais',
                                  textAlign: TextAlign.left,
                                  style: Constants.textToFormFieldsINPUT,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 13, right: 13),
                          child: WidgetSearchList(
                              getListaFrom:
                                  AutoCompleteService.getServicosAdicionais,
                              onChange: (x) {
                                controllerUsinaStore.atualizaServicosDaLista(x);
                              },
                              onSelect: (s) {
                                // Adicionar a Lista id:qtd:valor_de_custo
                                controllerUsinaStore.adicionaServicosParaLista(
                                    "${s.id}", "${s.qtd}", s.valor_de_custo);
                              },
                              onTap: () {
                                returnScroll(800);
                              },
                              onPressed: (a) =>
                                  controllerUsinaStore.removeServicosDaLista(a),
                              onClickViewDetail: (a) {},
                              onChanged: (a) {}),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Observer(builder: (BuildContext context) {
                            return TextFormField(
                              decoration: InputDecoration(
                                  prefixText: 'Valor de serviços dos itens'),
                              textAlign: TextAlign.right,
                              controller:
                                  controllerUsinaStore.valorDeCustoDosServicos,
                              onTap: () {},
                              style: Constants.textToFormFields
                                  .copyWith(fontSize: 13),
                              inputFormatters: <TextInputFormatter>[
                                CurrencyTextInputFormatter(
                                  locale: 'pt_BR',
                                  customPattern: "R\$ #,##0.00",
                                  decimalDigits: 2,
                                )
                              ],
                              keyboardType: TextInputType.number,
                            );
                          }),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 30),
                child: const Text(
                  'Adicionar imposto',
                  textAlign: TextAlign.left,
                  style: Constants.textToFormFieldsINPUT,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(
                        Icons.percent,
                        color: Colors.grey,
                      ), // icon is 48px widget.
                    ),
                    hintText: 'Digite em % ',
                    hintStyle: TextStyle(fontSize: 13)),

                keyboardType: TextInputType.number,
                controller: controllerUsinaStore.impostoParaLucroController,
                maxLength: 5,

                inputFormatters: <TextInputFormatter>[
                  CurrencyTextInputFormatter(
                    locale: 'pt_BR',
                    customPattern: "0,00",
                    decimalDigits: 0,
                  ),
                ],

                onSaved: (v) {},
                //autofocus: true,
                style: Constants.textToFormFields,
                // controller: controller.codigoInputController,
                onFieldSubmitted: (v) {},
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 30),
                child: const Text(
                  'Valor de custo do sistema',
                  textAlign: TextAlign.left,
                  style: Constants.textToFormFieldsINPUT,
                ),
              ),
              TextFormField(
                onChanged: (value) => {},
                readOnly: true,
                controller:
                    controllerUsinaStore.valorDeCustoTotalDoSistemaController,
                inputFormatters: <TextInputFormatter>[
                  CurrencyTextInputFormatter(
                    locale: 'pt_BR',
                    customPattern: "R\$ #,##0.00",
                    decimalDigits: 2,
                  )
                ],
                keyboardType: TextInputType.number,

                onTap: () {},
                //autofocus: true,
                style: Constants.textToFormFields,
                // controller: controller.codigoInputController,
                onFieldSubmitted: (v) {},
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 30),
                child: const Text(
                  'Adicionar Lucro',
                  textAlign: TextAlign.left,
                  style: Constants.textToFormFieldsINPUT,
                ),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.percent,
                              color: Colors.grey,
                            ), // icon is 48px widget.
                          ),
                          hintText: 'Digite em % ',
                          hintStyle: TextStyle(fontSize: 13)),
                      controller:
                          controllerUsinaStore.lucroPorcentagemController,

                      keyboardType: TextInputType.number,

                      inputFormatters: <TextInputFormatter>[
                        new LengthLimitingTextInputFormatter(6),
                      ],

                      onSaved: (v) {},
                      //autofocus: true,
                      style: Constants.textToFormFields,
                      // controller: controller.codigoInputController,
                      onFieldSubmitted: (v) {},
                    ),
                  ),
                  Text(
                    '=',
                  ),
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.attach_money,
                              color: Colors.grey,
                            ), // icon is 48px widget.
                          ),
                          hintText: 'Valor transcrito em R\$',
                          hintStyle: TextStyle(fontSize: 13)),

                      onChanged: (value) {},
                      readOnly: true,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        CurrencyTextInputFormatter(
                          locale: 'pt_BR',
                          customPattern: "R\$ #,##0.00",
                          decimalDigits: 2,
                        )
                      ],
                      controller: controllerUsinaStore.lucroReaisController,

                      onTap: () {},
                      //autofocus: true,
                      style: Constants.textToFormFields,
                      // controller: controller.codigoInputController,
                      onFieldSubmitted: (v) {},
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 30),
                child: const Text(
                  'Valor de venda final',
                  textAlign: TextAlign.left,
                  style: Constants.textToFormFieldsINPUT,
                ),
              ),
              Observer(builder: (BuildContext context) {
                return TextFormField(
                  controller: controllerUsinaStore.valorVendaFinalController,
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Icon(
                        Icons.monetization_on,
                        color: Colors.grey,
                      ), // icon is 48px widget.
                    ),
                    hintStyle: TextStyle(fontSize: 13),
                    hintText: 'Valor de venda',
                  ),

                  onChanged: (value) => {},
                  keyboardType: TextInputType.number,

                  inputFormatters: <TextInputFormatter>[
                    new LengthLimitingTextInputFormatter(6),
                    CurrencyTextInputFormatter(
                      symbol: '%',
                      locale: 'pt_BR',
                      customPattern: "R\$ #,##0.00",
                      decimalDigits: 2,
                    )
                  ],

                  onTap: () {},
                  //autofocus: true,
                  style: Constants.textToFormFields,
                  // controller: controller.codigoInputController,
                  onFieldSubmitted: (v) {},
                );
              }),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 30),
                child: const Text(
                  'Descrição / Alias da Usina',
                  textAlign: TextAlign.left,
                  style: Constants.textToFormFieldsINPUT,
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    //returnScroll(0.0);
                    return 'Digite a descriçao da usina';
                  }
                  return null;
                },
                //autofocus: true,
                style: Constants.textToFormFields,
                controller: controllerUsinaStore.aliasController,
                onFieldSubmitted: (v) {},
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: arguments?['id'] == null
                      ? const Text('Avançar')
                      : Text('Atualizar'),
                  onPressed: () async {
                    arguments?['id'] == null
                        ? controllerUsinaStore.montarUsinaParaEnviar(context, 0)
                        : controllerUsinaStore.montarUsinaParaEnviar(
                            context, arguments?['id']);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Constants.corPrimaria,
                      padding:
                          EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                      textStyle: Constants.textToFormFieldsINPUT),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
