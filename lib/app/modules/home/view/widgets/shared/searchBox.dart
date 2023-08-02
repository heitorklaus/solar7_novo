// ignore_for_file: file_names, unused_import, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:solardino/app/modules/home/store/home_store.dart';

import '../../../../../shared/responsive/responsive_layout.dart';

class SearchBox extends StatefulWidget {
  final fontSize;
  final contentPaddingTop;
  final contentPaddingLeft;
  final device;

  const SearchBox(
      {Key? key,
      String? valor,
      double? this.fontSize,
      double? this.contentPaddingTop,
      double? this.contentPaddingLeft,
      String? this.device})
      : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  Widget returnSufixPotencia() {
    return Observer(builder: (BuildContext context) {
      var potenciaIndicada;

      final controller = Modular.get<HomeStore>();

      potenciaIndicada = controller.listBuscaPotencia?.value;

      if (potenciaIndicada != null) {
        return Text(potenciaIndicada.toString() + ' kWp');
      } else {
        return const Text('');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<HomeStore>();

    return TextField(
      controller: controller.search,
      style: TextStyle(
          fontSize: widget.fontSize, height: 1.0, color: Colors.black),
      decoration: InputDecoration(
        suffixIcon: Container(
          padding: EdgeInsets.only(
              top: widget.device == 'isComputer' ? 0 : 15,
              right: widget.device == 'isComputer' ? 10 : 15),
          child: widget.device == 'isPhone'
              ? returnSufixPotencia()
              : IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
        ),

        // suffixIcon: returnSufixPotencia(),
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(
            top: widget.contentPaddingTop, left: widget.contentPaddingLeft),
      ),
    );
  }
}
