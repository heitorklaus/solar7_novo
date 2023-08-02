import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:solardino/app/modules/splash/splash_store.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'package:provider/provider.dart';

import 'app/modules/login/store/login_store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ModularApp(
      module: AppModule(),
      child: Provider<SplashStore>(
        create: (_) => SplashStore(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: Provider<LoginStore>(
            create: (_) => LoginStore(),
            child: AppWidget(),
          ),
        ),
      )));
}
