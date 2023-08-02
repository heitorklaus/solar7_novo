// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:solardino/app/modules/home/store/home_store.dart';

import '../../../modules/home/view/widgets/shared/searchBox.dart';
import '../../responsive/constants.dart';
import '../../responsive/responsive_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarWidget extends StatefulWidget {
  final searchField;
  final showBack;
  const AppBarWidget(
      {Key? key, required this.searchField, required this.showBack})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

// ignore: deprecated_member_use
class _AppBarWidgetState extends ModularState<AppBarWidget, HomeStore> {
  Widget returnSufixPotencia() {
    return Observer(builder: (BuildContext context) {
      var potenciaIndicada;
      potenciaIndicada = controller.listBuscaPotencia?.value;

      if (potenciaIndicada != null) {
        return Text('$potenciaIndicada kWp');
      } else {
        return const Text('vazio');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Constants.corPrimaria,
                spreadRadius: 2,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.only(bottom: 6, top: 11),
          height: widget.searchField ? 169 : 100,
          // color: Constants.corPrimaria,
          child: Column(
            children: [
              if (ResponsiveLayout.isPhone(context))
                const SizedBox(
                  height: 30,
                ),
              Row(
                mainAxisAlignment: ResponsiveLayout.isPhone(context)
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.start,
                children: [
                  if (ResponsiveLayout.isComputer(context))
                    const SizedBox(
                      width: 80,
                    )
                  else
                    widget.searchField
                        ? widget.showBack == false
                            ? IconButton(
                                color: Colors.white,
                                iconSize: 30,
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                icon: const Icon(Icons.menu),
                              )
                            : IconButton(
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
                              )
                        : IconButton(
                            color: Colors.white,
                            iconSize: 30,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 20,
                            ),
                          ),
                  SvgPicture.asset(
                    'lib/app/shared/assets/images/logodino.svg',
                    height: 34,
                  ),
                  if (ResponsiveLayout.isPhone(context))
                    const SizedBox(
                      width: 40,
                    ),
                  if (ResponsiveLayout.isComputer(context))
                    Container(
                        width: 530,
                        height: 50,
                        margin:
                            const EdgeInsets.only(left: 46, right: 12, top: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const SearchBox(
                            device: 'isComputer',
                            fontSize: 16,
                            contentPaddingTop: 13,
                            contentPaddingLeft: 14)),
                ],
              ),
              if (ResponsiveLayout.isPhone(context))
                if (widget.searchField)
                  Container(
                      margin:
                          const EdgeInsets.only(left: 12, right: 12, top: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const SearchBox(
                        device: 'isPhone',
                        fontSize: 25,
                        contentPaddingTop: 14,
                        contentPaddingLeft: 14,
                      )),
            ],
          ),
        ),
      ],
    );
  }
}
