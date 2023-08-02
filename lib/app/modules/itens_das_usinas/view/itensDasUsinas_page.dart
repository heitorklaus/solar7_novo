import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:solardino/app/modules/home/view/widgets/widget_contratos_fechados/widget_contratos.dart';
import 'package:solardino/app/modules/home/view/widgets/widget_usinas_cadastradas/widget_usinas_cadastradas.dart';
import 'package:solardino/app/modules/itens_das_usinas/store/itensDasUsinas_store.dart';
import 'package:solardino/app/modules/itens_das_usinas/view/widgets/widget_cadastra_itens.dart';
import 'package:solardino/app/modules/itens_das_usinas/view/widgets/widget_lista_de_itens.dart';
import 'package:solardino/app/modules/usinas/view/usinas_page.dart';
import 'package:solardino/app/shared/database_settings/shared_pref_helper.dart';
import 'package:solardino/app/shared/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

import '../../../shared/database_settings/initialization_helper.dart';
import '../../../shared/drawer/drawer_page.dart';
import '../../../shared/responsive/constants.dart';
import '../../../shared/widgets/appBar/app_bar_widget.dart';
// PDF
import 'package:flutter/foundation.dart' show kIsWeb;

class ItensDasUsinas extends StatefulWidget {
  const ItensDasUsinas({Key? key}) : super(key: key);

  @override
  _ItensDasUsinasState createState() => _ItensDasUsinasState();
}

class _ItensDasUsinasState extends State<ItensDasUsinas> {
  int? currentIndex;
  String? valor;

  String pagina = '';
  ItensDasUsinasStore controllerItensDasUsinas =
      Modular.get<ItensDasUsinasStore>();

  @override
  void initState() {
    super.initState();

    final widgetsBinding = WidgetsBinding.instance;
    widgetsBinding.addPostFrameCallback((callback) {});
    currentIndex = 0;
  }

  // t

  @override
  Widget build(BuildContext context) {
    controllerItensDasUsinas.getListaDeItens('', context);
    Map? arguments = ModalRoute.of(context)?.settings.arguments as Map?;

    if (arguments!['currentIndex'] == 1) {
      setState(() {
        currentIndex = 1;
      });
    }

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
            : null,
        body: ResponsiveLayout(
          tiny: Container(),
          phone: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: currentIndex == 0
                  ? WidgetListaDeItens()
                  : WidgetCadastraItens()),
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
                  Expanded(child: WidgetCadastraItens()),
                  Container(
                    margin: EdgeInsets.only(top: 55),
                    width: 2,
                    child: VerticalDivider(
                      color: Constants.corPrimaria,
                      thickness: 2,
                    ),
                  ),
                  Expanded(child: WidgetListaDeItens()),
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
                    icon: Icon(Icons.list),
                    label: 'Ver Lista  de itens',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.add_box,
                    ),
                    label: 'Novo Item da usina',
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
