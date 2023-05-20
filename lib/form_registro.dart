
import 'package:cantina/usuario_model.dart';
import 'package:flutter/material.dart';

import 'dados/autenticao_email_helper.dart';




class FormRegistro extends StatefulWidget {
  final  AutenticacaoEmailHelper helper;
  const FormRegistro({super.key, required this.helper});

  @override
  State<FormRegistro> createState() => _FormRegistroState();
}

class _FormRegistroState extends State<FormRegistro> {
  Usuario usuario = Usuario();

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          key: key,
          child: Column(
            children: [
              input(
                'Nome',
                validacao: (value) {
                  if ((value?.length ?? 0) < 2) {
                    return 'Nome deve ter mais que dois caracteres';
                  } else {
                    return null;
                  }
                },
                onsaved: (value) => usuario.nome = value, // <<<<<
              ),
              input(
                'E-mail',
                onsaved: (value) => usuario.email = value,
                validacao: (value) => !(value?.contains("@") ?? false)
                    ? "E-mail inválido"
                    : null, // <<<<<
              ),
              input('Senha',
                  validacao: (value) => (value?.length ?? 0) < 3
                      ? "Senha deve ter no mínimo 3 caracteres"
                      : null,
                  onchange: (value) => usuario.senha = value,
                  senha: true),
              input('Confirma Senha',
                  validacao: (value) =>
                      value == usuario.senha ? null : "Senha não confere!",
                  senha: true),
              ElevatedButton(
                  onPressed: () async {
                    if (key.currentState?.validate() ?? false) {
                      key.currentState?.save();
                      try {
                        await widget.helper.registrar(usuario.email!, usuario.senha!);
                       ;
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Usuário registrado com sucesso!")));
                        Navigator.of(context).pop();
                      } catch (e) {
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Registro de usuário falhou!")));
                      }
                    }
                  },
                  child: const Text('Salvar'))
            ],
          )),
    );
  }

  input(String label,
      {String? Function(String? value)? validacao,
      Function(String? value)? onchange,
      Function(String? value)? onsaved, // <<<<<
      bool senha = false}) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration:
              InputDecoration(label: Text(label), border: OutlineInputBorder()),
          validator: validacao,
          onChanged: onchange,
          onSaved: onsaved, // <<<<<
          obscureText: senha,
        ));
  }
}
