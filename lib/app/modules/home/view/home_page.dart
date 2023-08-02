// ignore_for_file: sized_box_for_whitespace, unused_element, prefer_const_constructors, library_private_types_in_public_api, prefer_interpolation_to_compose_strings

import 'dart:async';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:solardino/app/modules/home/view/widgets/widget_contratos_fechados/widget_contratos.dart';
import 'package:solardino/app/modules/home/view/widgets/widget_ultimos_orcamentos/widget_ultimos_orcamentos.dart';
import 'package:solardino/app/modules/home/view/widgets/widget_usinas_cadastradas/widget_usinas_cadastradas.dart';
import 'package:solardino/app/modules/itens_das_usinas/view/widgets/widget_cadastra_itens.dart';
import 'package:solardino/app/modules/itens_das_usinas/view/widgets/widget_lista_de_itens.dart';
import 'package:solardino/app/modules/usinas/view/usinas_page.dart';
import 'package:solardino/app/shared/database_settings/shared_pref_helper.dart';
import 'package:solardino/app/shared/responsive/constants.dart';
import 'package:solardino/app/shared/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

import '../../../shared/database_settings/initialization_helper.dart';
import '../../../shared/drawer/drawer_page.dart';
import '../../../shared/widgets/appBar/app_bar_widget.dart';
import '../store/home_store.dart';
// PDF
import 'dart:typed_data';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'mobile.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart' show kIsWeb;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  late String valor;
  int t = 0;
  String? pagina;

  final controller = Modular.get<HomeStore>();

  @override
  void initState() {
    super.initState();
    kIsWeb ? null : InitializationHelper.getInstance().db;
    valor = '/inicio';
    // Prefs.setString('modulo', '/inicio');
    // Timer.periodic(const Duration(seconds: 1), (Timer t) async {
    //   String v = await Prefs.getString('modulo');
    //   setState(() {
    //     valor = v;
    //   });
    // });

    final widgetsBinding = WidgetsBinding.instance;
    widgetsBinding.addPostFrameCallback((callback) {
      controller.getLista('');
    });
  }

  Widget returnSufixPotencia() {
    return Observer(builder: (BuildContext context) {
      // ignore: prefer_typing_uninitialized_variables
      var potenciaIndicada;
      potenciaIndicada = controller.listBuscaPotencia?.value;

      if (potenciaIndicada != null) {
        return Text(potenciaIndicada.toString() + ' kWp');
      } else {
        return const Text('vazio');
      }
    });
  }

  // t

  @override
  Widget build(BuildContext context) {
    Map? arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    if (arguments?['pagina'] == '/configuracoes') {
      Modular.to
          .pushNamedAndRemoveUntil('/configuracoes', ModalRoute.withName('/'));
    }
    if (arguments?['pagina'] == '/itens_das_usinas') {
      setState(() {
        pagina = '/itens_das_usinas';
      });
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(
              double.infinity, ResponsiveLayout.isPhone(context) ? 200 : 100),
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
        ),
        body: ResponsiveLayout(
          tiny: Container(),
          phone: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: currentIndex == 0
                ? retornaWidget1(pagina)
                : currentIndex == 1

                    // AQUI MOSTRA OS DOIS WIDGETS LADO A LADO WEB
                    ? WidgetUsinasCadastradas(
                        valor: controller.search.text,
                      )
                    : WidgetContratosFechados(),
          ),
          tablet: Row(
            children: [
              Expanded(child: WidgetUsinasCadastradas()),
              Expanded(
                child: WidgetUsinasCadastradas(),
              )
            ],
          ),
          largeTablet: Row(
            children: [
              Expanded(child: WidgetUsinasCadastradas()),
              Expanded(child: WidgetUsinasCadastradas()),
              Expanded(
                child: WidgetContratosFechados(),
              )
            ],
          ),
          computer: Row(
            children: [
              Stack(
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
                ],
              ),
              if (ResponsiveLayout.isComputer(context))
                Container(
                  color: Constants.corPrimaria,
                  width: 20,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Constants.corSecundaria,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: Row(children: [
                  Expanded(child: WidgetUltimosOrcamentos()),
                  SizedBox(
                    width: 7,
                  ),
                  Container(
                    width: 2,
                    child: VerticalDivider(
                      color: Constants.corPrimaria,
                      thickness: 2,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Expanded(child: WidgetUsinasCadastradas()),
                  SizedBox(
                    width: 7,
                  ),
                  Container(
                    width: 2,
                    child: VerticalDivider(
                      color: Constants.corPrimaria,
                      thickness: 2,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Expanded(child: WidgetContratosFechados()),
                  SizedBox(
                    width: 7,
                  ),
                ]),
              ),
            ],
          ),
        ),

        drawer: pagina != null
            ? SizedBox()
            : DrawerPage(
                onSelect: (page) {
                  setState(() {
                    pagina = page;
                  });
                },
              ),
        // bottomNavigationBar: ResponsiveLayout.isPhone(context)
        //     ? CurvedNavigationBar(
        //         animationDuration: Duration(microseconds: 2),
        //         index: currentIndex,
        //         backgroundColor: Constants.corSecundaria,
        //         items: _icons,
        //         onTap: (index) {
        //           setState(() {
        //             currentIndex = index;
        //           });
        //         },
        //       )
        //     : SizedBox(),
        bottomNavigationBar: ResponsiveLayout.isPhone(context)
            ? pagina != null
                ? SizedBox()
                : BottomNavigationBar(
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
                          Icons.home,
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.business),
                        label: 'Usinas',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.school),
                        label: 'Contratos',
                      ),
                    ],
                    currentIndex: currentIndex,
                    //selectedItemColor: Colors.amber[800],
                    onTap: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  )
            : const SizedBox(),
      ),
    );
  }

  Widget retornaWidget1(pagina) {
    if (pagina == null) {
      return SizedBox();
    }
    if (pagina == '/itens_das_usinas') {
      return WidgetListaDeItens(
        valor: controller.search.text,
      );
    }

    return SizedBox();
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:solardino/app/modules/home/store/home_store.dart';
// // PDF
// import 'dart:typed_data';
// import 'package:syncfusion_flutter_pdf/pdf.dart';
// import 'mobile.dart';
// import 'package:flutter/services.dart' show rootBundle;

// class HomePage extends StatefulWidget {
//   final String title;
//   const HomePage({Key? key, this.title = "Home"}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends ModularState<HomePage, HomeStore> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(onPressed: _createPDF, child: Text('CRIAR PDF')),
//       ),
//     );
//   }

Future<void> _createPDF() async {
  PdfDocument document = PdfDocument();
  //Create a PDF document instance.

  /// //Create a PDF page settings.
  PdfPageSettings settings = PdfPageSettings();
  settings.margins.all = -2;

  /// //Set the page settings to document.
  document.pageSettings = settings;

  final page = document.pages.add();

  PdfTextElement nomeDoCliente = PdfTextElement(text: 'Ipiranga S.A');
  PdfTextElement geracaoKwh = PdfTextElement(text: 'Geração 1450kWh');

  PdfStandardFont returnTamanhoFonte(double fonte, PdfFontStyle estilo) {
    PdfStandardFont tamanhoFonte =
        PdfStandardFont(PdfFontFamily.helvetica, fonte, style: estilo);
    return tamanhoFonte;
  }

  //Pagina 1
  page.graphics.drawPdfTemplate(
      PdfTemplate(597, 845)
        ..graphics!.drawImage(PdfBitmap(await _readImageData('pagina-1.png')),
            Rect.fromLTWH(0, 0, 597, 845))
        //Nome do cliente
        ..graphics!.drawString(
            nomeDoCliente.text, returnTamanhoFonte(20, PdfFontStyle.bold),
            brush: PdfBrushes.white, bounds: Rect.fromLTWH(10, 787, 0, 0))
        // Geracao em KWH
        ..graphics!.drawString(
            geracaoKwh.text, returnTamanhoFonte(18, PdfFontStyle.regular),
            brush: PdfBrushes.white, bounds: Rect.fromLTWH(10, 815, 0, 0)),
      Offset(0, 0));

  //Pagina 2
  document.pages.add().graphics.drawPdfTemplate(
      PdfTemplate(597, 845)
        ..graphics!.drawImage(PdfBitmap(await _readImageData('pagina-2.png')),
            Rect.fromLTWH(0, 0, 597, 845))
        //Nome do cliente
        ..graphics!.drawString(
            nomeDoCliente.text, returnTamanhoFonte(20, PdfFontStyle.bold),
            brush: PdfBrushes.white, bounds: Rect.fromLTWH(10, 787, 0, 0))
        // Geracao em KWH
        ..graphics!.drawString(
            geracaoKwh.text, returnTamanhoFonte(18, PdfFontStyle.regular),
            brush: PdfBrushes.white, bounds: Rect.fromLTWH(10, 815, 0, 0)),
      Offset(0, 0));

  //Pagina 3
  document.pages.add().graphics.drawPdfTemplate(
      PdfTemplate(597, 845)
        ..graphics!.drawImage(PdfBitmap(await _readImageData('pagina-3.png')),
            Rect.fromLTWH(0, 0, 597, 845))
        //Nome do cliente
        ..graphics!.drawString(
            nomeDoCliente.text, returnTamanhoFonte(20, PdfFontStyle.bold),
            brush: PdfBrushes.white, bounds: Rect.fromLTWH(10, 787, 0, 0))
        // Geracao em KWH
        ..graphics!.drawString(
            geracaoKwh.text, returnTamanhoFonte(18, PdfFontStyle.regular),
            brush: PdfBrushes.white, bounds: Rect.fromLTWH(10, 815, 0, 0)),
      Offset(0, 0));

  //Pagina 4
  document.pages.add().graphics.drawPdfTemplate(
      PdfTemplate(597, 845)
        ..graphics!.drawImage(PdfBitmap(await _readImageData('pagina-4.png')),
            Rect.fromLTWH(0, 0, 597, 845))
        //Nome do cliente
        ..graphics!.drawString(
            nomeDoCliente.text, returnTamanhoFonte(20, PdfFontStyle.bold),
            brush: PdfBrushes.white, bounds: Rect.fromLTWH(10, 787, 0, 0))
        // Geracao em KWH
        ..graphics!.drawString(
            geracaoKwh.text, returnTamanhoFonte(18, PdfFontStyle.regular),
            brush: PdfBrushes.white, bounds: Rect.fromLTWH(10, 815, 0, 0)),
      Offset(0, 0));

  //Pagina 5
  document.pages.add().graphics.drawPdfTemplate(
      PdfTemplate(597, 845)
        ..graphics!.drawImage(PdfBitmap(await _readImageData('pagina-5.png')),
            Rect.fromLTWH(0, 0, 597, 845))
        //Nome do cliente
        ..graphics!.drawString(
            nomeDoCliente.text, returnTamanhoFonte(20, PdfFontStyle.bold),
            brush: PdfBrushes.white, bounds: Rect.fromLTWH(10, 787, 0, 0))
        // Geracao em KWH
        ..graphics!.drawString(
            geracaoKwh.text, returnTamanhoFonte(18, PdfFontStyle.regular),
            brush: PdfBrushes.white, bounds: Rect.fromLTWH(10, 815, 0, 0)),
      Offset(0, 0));

  //Pagina 6
  document.pages.add().graphics.drawPdfTemplate(
      PdfTemplate(597, 845)
        ..graphics!.drawImage(PdfBitmap(await _readImageData('pagina-6.png')),
            Rect.fromLTWH(0, 0, 597, 845))
        //Nome do cliente
        ..graphics!.drawString(
            nomeDoCliente.text, returnTamanhoFonte(20, PdfFontStyle.bold),
            brush: PdfBrushes.white, bounds: Rect.fromLTWH(10, 787, 0, 0))
        // Geracao em KWH
        ..graphics!.drawString(
            geracaoKwh.text, returnTamanhoFonte(18, PdfFontStyle.regular),
            brush: PdfBrushes.white, bounds: Rect.fromLTWH(10, 815, 0, 0)),
      Offset(0, 0));

  //Pagina 7
  document.pages.add().graphics.drawPdfTemplate(
      PdfTemplate(597, 845)
        ..graphics!.drawImage(PdfBitmap(await _readImageData('pagina-7.png')),
            Rect.fromLTWH(0, 0, 597, 845))
        //Nome do cliente
        ..graphics!.drawString(
            nomeDoCliente.text, returnTamanhoFonte(20, PdfFontStyle.bold),
            brush: PdfBrushes.white, bounds: Rect.fromLTWH(10, 787, 0, 0))
        // Geracao em KWH
        ..graphics!.drawString(
            geracaoKwh.text, returnTamanhoFonte(18, PdfFontStyle.regular),
            brush: PdfBrushes.white, bounds: Rect.fromLTWH(10, 815, 0, 0)),
      Offset(0, 0));

  List<int> bytes = document.save();
  document.dispose();

  saveAndLaunchFIle(bytes, 'Output.pdf');
}

Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('lib/app/shared/assets/images/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}
