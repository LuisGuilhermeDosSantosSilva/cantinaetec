import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(37, 39, 62, 100),
      child: Column(
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 1500,
            height: 500,
            fit: BoxFit.fill,
          )
        ],
      ),
    );
  }
}
