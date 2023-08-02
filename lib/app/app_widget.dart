import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:solardino/app/shared/responsive/constants.dart';

class AppWidget extends StatelessWidget {
  final ThemeData theme = ThemeData();

  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slidy',
      theme: ThemeData(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Constants.corSecundaria),
          primaryIconTheme: const IconThemeData(size: 30, color: Colors.white),
          scaffoldBackgroundColor: Constants.corSecundaria,
          primaryColor: Constants.corPrimaria,
          primarySwatch: Constants.corItensApp,
          iconTheme: const IconThemeData(size: 30, color: Colors.red),
          canvasColor: Constants.corPrimaria),
    );
  }
}
