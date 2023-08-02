// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:solardino/app/modules/itens_das_usinas/store/itensDasUsinas_store.dart';
import 'package:solardino/app/modules/usinas/store/usinas_store.dart';

import '../../../../shared/responsive/constants.dart';
import '../../../../shared/responsive/responsive_layout.dart';
import '../../../../shared/widgets/autocomplete/autocomplete_service.dart';
import '../../../../shared/widgets/autocomplete/autocomplete_widget.dart';
import '../../../../shared/widgets/autocomplete/widget_search_list.dart';

class WidgetCadastraItens extends StatefulWidget {
  WidgetCadastraItens({Key? key, String? valor}) : super(key: key);

  @override
  State<WidgetCadastraItens> createState() => _WidgetCadastraItensState();
}

class _WidgetCadastraItensState extends State<WidgetCadastraItens> {
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
        automaticallyImplyLeading: false,

        centerTitle: false,
        leadingWidth: 0, // thi
        titleSpacing: 0.0,
        backgroundColor: Constants.corPrimaria,
        elevation: 0,
        title: Container(
          child: Container(
            width: double.infinity,
            child: Row(
              children: [
                IconButton(
                  color: Colors.white,
                  iconSize: 30,
                  onPressed: () {
                    // Modular.to.pushNamedAndRemoveUntil(
                    //     '/configuracoes',
                    //     ModalRoute.withName('/'));
                    Modular.to.pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Text("Novo item da usina",
                    style: Constants.textCardTitle.copyWith(
                        color: Constants.corSecundaria, fontSize: 17)),
                const Spacer(),
                const SizedBox(
                  width: 7,
                ),
              ],
              //leading: Icon(Icons.shopping_basket),
            ),
          ),
        ),
      ),
      body: Center(
        child: Stack(
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
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(top: 30),
                      child: const Text(
                        'Nome do item',
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
                      child: Text(
                        'Categoria do item',
                        textAlign: TextAlign.left,
                        style: Constants.textToFormFieldsINPUT,
                      ),
                    ),
                    Container(
                      child: Stack(
                        children: [
                          AutoCompleteWidget(
                            getListaData: AutoCompleteService.getTipoModulo,
                            controller: controllerItensDaUsinaStore
                                .tipoDeModuloController,
                            onSelect: (resultadoSelecionado) {},
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                Modular.to.pushNamed('/categoria_dos_itens',
                                    arguments: {
                                      'pagina': '/cadastra_itens_das_usinas'
                                    });
                              },
                              icon: Icon(Icons.add_box,
                                  color: Constants.corPrimaria, size: 30),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        'Fabricante',
                        textAlign: TextAlign.left,
                        style: Constants.textToFormFieldsINPUT,
                      ),
                    ),
                    Container(
                      child: Stack(
                        children: [
                          AutoCompleteWidget(
                            getListaData: AutoCompleteService.getTipoModulo,
                            controller: controllerItensDaUsinaStore
                                .tipoDeModuloController,
                            onSelect: (resultadoSelecionado) {},
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                Modular.to.pushNamed('/fabricante_dos_itens',
                                    arguments: {
                                      'pagina': '/cadastrar_fabricante'
                                    });
                              },
                              icon: Icon(Icons.add_box,
                                  color: Constants.corPrimaria, size: 30),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        'Distribuidor',
                        textAlign: TextAlign.left,
                        style: Constants.textToFormFieldsINPUT,
                      ),
                    ),
                    Container(
                      child: Stack(
                        children: [
                          AutoCompleteWidget(
                            getListaData: AutoCompleteService.getTipoModulo,
                            controller: controllerItensDaUsinaStore
                                .tipoDeModuloController,
                            onSelect: (resultadoSelecionado) {},
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                Modular.to.pushNamed('/distribuidor_dos_itens',
                                    arguments: {
                                      'pagina': '/cadastrar_distribuidor'
                                    });
                              },
                              icon: Icon(Icons.add_box,
                                  color: Constants.corPrimaria, size: 30),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        'Imagem do item',
                        textAlign: TextAlign.left,
                        style: Constants.textToFormFieldsINPUT,
                      ),
                    ),
                    Container(
                      child: Stack(
                        children: [
                          AutoCompleteWidget(
                            getListaData: AutoCompleteService.getTipoModulo,
                            controller: controllerItensDaUsinaStore
                                .tipoDeModuloController,
                            onSelect: (resultadoSelecionado) {},
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                Modular.to.pushNamed('/distribuidor_dos_itens',
                                    arguments: {
                                      'pagina': '/cadastrar_distribuidor'
                                    });
                              },
                              icon: Icon(Icons.add_box,
                                  color: Constants.corPrimaria, size: 30),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        'Potência  (somente para inversores)',
                        textAlign: TextAlign.left,
                        style: Constants.textToFormFieldsINPUT,
                      ),
                    ),
                    Observer(builder: (BuildContext context) {
                      return TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (val) {},
                        onTap: () {},
                        style: Constants.textToFormFields,
                      );
                    }),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        'Valor de custo',
                        textAlign: TextAlign.left,
                        style: Constants.textToFormFieldsINPUT,
                      ),
                    ),
                    Observer(builder: (BuildContext context) {
                      return TextFormField(
                        onTap: () {},
                        style: Constants.textToFormFields,
                      );
                    }),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        'Valor de venda',
                        textAlign: TextAlign.left,
                        style: Constants.textToFormFieldsINPUT,
                      ),
                    ),
                    Observer(builder: (BuildContext context) {
                      return TextFormField(
                        onTap: () {},
                        style: Constants.textToFormFields,
                      );
                    }),
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 15),
                            textStyle: Constants.textToFormFieldsINPUT),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
