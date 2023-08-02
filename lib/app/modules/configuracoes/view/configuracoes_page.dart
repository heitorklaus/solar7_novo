import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solardino/app/modules/configuracoes/store/configuracoes_store.dart';
import 'package:flutter/material.dart';
import 'package:solardino/app/shared/responsive/constants.dart';

class ConfiguracoesPage extends StatefulWidget {
  final String title;
  const ConfiguracoesPage({Key? key, this.title = 'Configurações do App'})
      : super(key: key);
  @override
  ConfiguracoesPageState createState() => ConfiguracoesPageState();
}

class ConfiguracoesPageState extends State<ConfiguracoesPage> {
  final ConfiguracoesStore store = Modular.get();
  _willPopCallback() async {
    // Modular.to.pushNamedAndRemoveUntil('/home', ModalRoute.withName('/'));
    Modular.to.pushNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.corPrimaria,
          title: Text(
            'Configuração do App',
            style: Constants.textTitlePages.copyWith(fontSize: 18),
          ),
          leading: IconButton(
              icon: Icon(Icons.home, size: 26, color: Colors.white),
              onPressed: () {
                _willPopCallback();
              }),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 110,
                    width: 110,
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Constants.corPrimaria,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),

                          minimumSize: Size.zero, // Set this
                          padding: EdgeInsets.zero, // and this
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              SvgPicture.asset(
                                'lib/app/shared/assets/icons/configuracoes_sune.svg',
                                height: 60,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Placas solares',
                                style: Constants.textTitlePages
                                    .copyWith(fontSize: 12),
                              )
                            ],
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 110,
                    width: 110,
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Constants.corPrimaria,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),

                          minimumSize: Size.zero, // Set this
                          padding: EdgeInsets.zero, // and this
                        ),
                        onPressed: () {
                          // var page = '/itens_das_usinas';
                          // Navigator.pop(context, page); //

                          Modular.to.pushNamed('/itens_das_usinas',
                              arguments: {'pagina': '/lista_itens_das_usinas'});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              SvgPicture.asset(
                                'lib/app/shared/assets/icons/configuracoes_servicos.svg',
                                height: 60,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Itens da usina',
                                style: Constants.textTitlePages
                                    .copyWith(fontSize: 12),
                              )
                            ],
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 110,
                    width: 110,
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Constants.corPrimaria,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),

                          minimumSize: Size.zero, // Set this
                          padding: EdgeInsets.zero, // and this
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              SvgPicture.asset(
                                'lib/app/shared/assets/icons/configuracoes_itens.svg',
                                height: 60,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Serviços da usina',
                                style: Constants.textTitlePages
                                    .copyWith(fontSize: 12),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 110,
                    width: 110,
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Constants.corPrimaria,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),

                          minimumSize: Size.zero, // Set this
                          padding: EdgeInsets.zero, // and this
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              SvgPicture.asset(
                                'lib/app/shared/assets/icons/configuracoes_distribuidores.svg',
                                height: 60,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Distribuidores',
                                style: Constants.textTitlePages
                                    .copyWith(fontSize: 12),
                              )
                            ],
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 110,
                    width: 110,
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Constants.corPrimaria,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),

                          minimumSize: Size.zero, // Set this
                          padding: EdgeInsets.zero, // and this
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              SvgPicture.asset(
                                'lib/app/shared/assets/icons/configuracoes_fabricantes.svg',
                                height: 60,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Fabricantes',
                                style: Constants.textTitlePages
                                    .copyWith(fontSize: 12),
                              )
                            ],
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 110,
                    width: 110,
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Constants.corPrimaria,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),

                          minimumSize: Size.zero, // Set this
                          padding: EdgeInsets.zero, // and this
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 18,
                              ),
                              SvgPicture.asset(
                                'lib/app/shared/assets/icons/configuracoes_prestadores.svg',
                                height: 40,
                              ),
                              SizedBox(
                                height: 17,
                              ),
                              Text(
                                'Prestadores',
                                style: Constants.textTitlePages
                                    .copyWith(fontSize: 12),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 110,
                    width: 110,
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Constants.corPrimaria,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),

                          minimumSize: Size.zero, // Set this
                          padding: EdgeInsets.zero, // and this
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 18,
                              ),
                              SvgPicture.asset(
                                'lib/app/shared/assets/icons/configuracoes_modulos.svg',
                                height: 48,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'App & Ajustes',
                                style: Constants.textTitlePages
                                    .copyWith(fontSize: 12),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
