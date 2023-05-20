import 'package:cantina/dados/autenticao_email_helper.dart';
import 'package:flutter/material.dart';

import 'form_registro.dart';

class RegistroPage extends StatelessWidget {
  final AutenticacaoEmailHelper helper;
  const RegistroPage({super.key, required this.helper});
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormRegistro(helper: helper),
      appBar: AppBar(
        title: Text('Registro'),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
