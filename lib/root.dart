import 'package:flutter/material.dart';

import 'login.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "EtecFood",
      initialRoute: "/",
      routes: {
        "/": (context) => Login(),
      },
    );
  }
}
