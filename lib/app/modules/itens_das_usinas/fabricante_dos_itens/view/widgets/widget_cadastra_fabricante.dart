// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:solardino/app/modules/itens_das_usinas/store/itensDasUsinas_store.dart';
import 'package:solardino/app/modules/usinas/store/usinas_store.dart';

import '../../../../../shared/responsive/constants.dart';
import '../../../../../shared/responsive/responsive_layout.dart';
import '../../../../../shared/widgets/autocomplete/autocomplete_service.dart';
import '../../../../../shared/widgets/autocomplete/autocomplete_widget.dart';
import '../../../../../shared/widgets/autocomplete/widget_search_list.dart';

class WidgetCadastraFabricante extends StatefulWidget {
  WidgetCadastraFabricante({Key? key, String? valor}) : super(key: key);

  @override
  State<WidgetCadastraFabricante> createState() =>
      _WidgetCadastraFabricanteState();
}

class _WidgetCadastraFabricanteState extends State<WidgetCadastraFabricante> {
  // A>A>A
  //
  ItensDasUsinasStore controllerItensDaUsinaStore =
      Modular.get<ItensDasUsinasStore>();
  ScrollController scrollController = ScrollController();
  int currentIndex = 0;
  String? valor;
  int t = 0;
  String pagina = '';

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

    if (arguments!['pagina'] == '/lista_categoria_itens_das_usinas') {
      setState(() {
        currentIndex = 0;
      });
    }

    if (arguments!['pagina'] == '/cadastra_categoria_itens_das_usinas') {
      setState(() {
        currentIndex = 1;
      });
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
              'Novo Fabricante',
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
      body: Stack(
        children: [
          if (ResponsiveLayout.isComputer(context))
            Container(
              color: Constants.corPrimaria,
              width: 18,
              child: Container(
                decoration: const BoxDecoration(
                  color: Constants.corSecundaria,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                  ),
                ),
              ),
            ),
          SingleChildScrollView(
            controller: scrollController,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(top: 30),
                    child: const Text(
                      'Nome do Fabricante',
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

                    onFieldSubmitted: (v) {},
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(top: 30),
                          child: Text(
                            'Cidade',
                            textAlign: TextAlign.left,
                            style: Constants.textToFormFieldsINPUT,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(top: 30),
                          child: Text(
                            'Estado',
                            textAlign: TextAlign.left,
                            style: Constants.textToFormFieldsINPUT,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Container(
                          child: Stack(
                            children: [
                              AutoCompleteWidget(
                                getListaData: AutoCompleteService.getTipoModulo,
                                controller: controllerItensDaUsinaStore
                                    .tipoDeModuloController,
                                onSelect: (resultadoSelecionado) {},
                                //  label: 'Selcione a cidade',
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          child: Stack(
                            children: [
                              AutoCompleteWidget(
                                getListaData: AutoCompleteService.getTipoModulo,
                                controller: controllerItensDaUsinaStore
                                    .tipoDeModuloController,
                                //   label: 'UF',
                                onSelect: (resultadoSelecionado) {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(top: 30),
                    child: const Text(
                      'CNPJ',
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

                    onFieldSubmitted: (v) {},
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(top: 30),
                    child: const Text(
                      'Telefone de Contato',
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

                    onFieldSubmitted: (v) {},
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text('Avançar'),
                      onPressed: () async {},
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
        ],
      ),
    );
  }
}
