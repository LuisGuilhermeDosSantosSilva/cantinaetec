import 'package:cantina/app_store.dart';
import 'package:cantina/dados/autenticacao_email_firebase.dart';
import 'package:cantina/login_page.dart';
import 'package:cantina/registro_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppStore appStore =AppStore();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context)=> LoginPage(appStore: appStore),
        "/registrar": (context)=> RegistroPage(helper: AutenticacaoEmailFirebase())
      },
    );
  }
}
    