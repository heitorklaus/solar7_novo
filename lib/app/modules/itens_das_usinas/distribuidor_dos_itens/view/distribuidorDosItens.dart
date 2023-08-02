import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:solardino/app/modules/home/view/widgets/widget_contratos_fechados/widget_contratos.dart';
import 'package:solardino/app/modules/home/view/widgets/widget_usinas_cadastradas/widget_usinas_cadastradas.dart';
import 'package:solardino/app/modules/itens_das_usinas/categoria_dos_itens/view/widgets/widget_categoria_cadastra.dart';
import 'package:solardino/app/modules/itens_das_usinas/categoria_dos_itens/view/widgets/widget_categoria_de_itens.dart';
import 'package:solardino/app/modules/itens_das_usinas/distribuidor_dos_itens/view/widgets/widget_cadastra_distribuidor.dart';
import 'package:solardino/app/modules/itens_das_usinas/distribuidor_dos_itens/view/widgets/widget_lista_distribuidor.dart';
import 'package:solardino/app/modules/itens_das_usinas/view/widgets/widget_cadastra_itens.dart';
import 'package:solardino/app/modules/itens_das_usinas/view/widgets/widget_lista_de_itens.dart';
import 'package:solardino/app/modules/usinas/view/usinas_page.dart';
import 'package:solardino/app/shared/database_settings/shared_pref_helper.dart';
import 'package:solardino/app/shared/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../../shared/drawer/drawer_page.dart';
import '../../../../shared/responsive/constants.dart';
import '../../../../shared/widgets/appBar/app_bar_widget.dart';

class DistribuidorDosItensPage extends StatefulWidget {
  const DistribuidorDosItensPage({Key? key}) : super(key: key);

  @override
  _DistribuidorDosItensPageState createState() =>
      _DistribuidorDosItensPageState();
}

class _DistribuidorDosItensPageState extends State<DistribuidorDosItensPage> {
  int? currentIndex;
  String? valor;
  int t = 0;
  String pagina = '';

  @override
  void initState() {
    super.initState();

    final widgetsBinding = WidgetsBinding.instance;
    widgetsBinding.addPostFrameCallback((callback) {});

    currentIndex = 1;
  }

  // t

  @override
  Widget build(BuildContext context) {
    Map? arguments = ModalRoute.of(context)?.settings.arguments as Map?;

    return Scaffold(
        // SE FOR 0   = HOME COM  A LISTA ( MOSTRA O CABECALHO PRA PROCURAR)
        // SE FOR QUALQUER NUMERO ESCONDE O CABECALHO

        appBar: currentIndex == 0
            ? PreferredSize(
                preferredSize: Size(double.infinity,
                    ResponsiveLayout.isPhone(context) ? 200 : 100),
                child: (ResponsiveLayout.isTinyLimit(context) ||
                        ResponsiveLayout.isTinyHeightLimit(context))
                    ? Container()
                    : Stack(
                        children: [
                          Stack(
                            children: [
                              AppBarWidget(
                                searchField: true,
                                showBack: pagina == null ? false : true,
                              ),
                            ],
                          ),
                        ],
                      ),
              )
            : ResponsiveLayout.isComputer(context)
                ? PreferredSize(
                    preferredSize: Size(double.infinity,
                        ResponsiveLayout.isPhone(context) ? 200 : 100),
                    child: (ResponsiveLayout.isTinyLimit(context) ||
                            ResponsiveLayout.isTinyHeightLimit(context))
                        ? Container()
                        : Stack(
                            children: [
                              Stack(
                                children: [
                                  AppBarWidget(
                                    searchField: true,
                                    showBack: pagina == null ? false : true,
                                  ),
                                ],
                              ),
                            ],
                          ),
                  )
                : null,
        body: ResponsiveLayout(
          tiny: Container(),
          phone: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: currentIndex == 0
                  ? WidgetListaDistribuidor()
                  : WidgetCadastraDistribuidor()),
          tablet: Row(
            children: [
              Expanded(child: Text('CadastraItens')),
              Expanded(
                child: Text('Lista'),
              )
            ],
          ),
          largeTablet: Row(
            children: [
              Expanded(child: Text('')),
              Expanded(child: Text('')),
              Expanded(
                child: Text(''),
              )
            ],
          ),
          computer: Row(
            children: [
              Container(
                  width: 300,
                  child: DrawerPage(
                    onSelect: (page) {
                      setState(() {
                        pagina = page;
                      });
                    },
                  )),
              Expanded(
                child: Row(children: [
                  Expanded(child: WidgetCategoriaCadastraPage()),
                  Container(
                    margin: EdgeInsets.only(top: 55),
                    width: 2,
                    child: VerticalDivider(
                      color: Constants.corPrimaria,
                      thickness: 2,
                    ),
                  ),
                  Expanded(child: WidgetListaDeCategoriaDeItens()),
                ]),
              ),
            ],
          ),
        ),
        bottomNavigationBar: ResponsiveLayout.isPhone(context)
            ? BottomNavigationBar(
                iconSize: 20,
                selectedItemColor: Constants.corPrimaria,
                selectedFontSize: 12,
                // unselectedIconTheme: const IconThemeData(color: Colors.black),
                // selectedIconTheme: const IconThemeData(color: Colors.blue),
                // selectedLabelStyle: const TextStyle(color: Colors.white),
                // selectedItemColor: Colors.blue,
                // backgroundColor: Colors.white,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.add_box,
                    ),
                    label: 'Lista de Categoria',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: 'Nova Categoria',
                  ),
                ],
                currentIndex: currentIndex!,
                //selectedItemColor: Colors.amber[800],
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              )
            : SizedBox());
  }
}
