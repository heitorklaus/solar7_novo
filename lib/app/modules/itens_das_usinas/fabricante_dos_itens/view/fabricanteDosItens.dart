import 'package:solardino/app/modules/itens_das_usinas/fabricante_dos_itens/view/widgets/widget_cadastra_fabricante.dart';
import 'package:solardino/app/modules/itens_das_usinas/fabricante_dos_itens/view/widgets/widget_lista_fabricante.dart';
import 'package:solardino/app/shared/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

import '../../../../shared/drawer/drawer_page.dart';
import '../../../../shared/responsive/constants.dart';
import '../../../../shared/widgets/appBar/app_bar_widget.dart';

class FabricanteDosItensPage extends StatefulWidget {
  const FabricanteDosItensPage({Key? key}) : super(key: key);

  @override
  _FabricanteDosItensPageState createState() => _FabricanteDosItensPageState();
}

class _FabricanteDosItensPageState extends State<FabricanteDosItensPage> {
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
                  ? WidgetListaFabricante()
                  : WidgetCadastraFabricante()),
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
                  Expanded(child: WidgetCadastraFabricante()),
                  Container(
                    margin: EdgeInsets.only(top: 55),
                    width: 2,
                    child: VerticalDivider(
                      color: Constants.corPrimaria,
                      thickness: 2,
                    ),
                  ),
                  Expanded(child: WidgetListaFabricante()),
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
                      Icons.list,
                    ),
                    label: 'Lista de Fabricante',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add_box),
                    label: 'Novo Fabricante',
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
