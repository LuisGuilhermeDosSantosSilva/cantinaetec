import 'package:cantina/dados/autenticao_email_helper.dart';
import 'package:flutter/material.dart';



import 'app_store.dart';

class FormLogin extends StatefulWidget {
  final AppStore appStore;
  final AutenticacaoEmailHelper helper;
  const FormLogin({super.key, required this.appStore, required this.helper});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  var visivel = false;
  var _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var email = "";
    var senha = "";

    return Container(
      width: MediaQuery.of(context).size.width *
          0.8, //largura propocional ao da tela
      child: Form(
          key: _key,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                onSaved: (newValue) => email = newValue ?? "",
                decoration: const InputDecoration(
                    labelText: "Email", prefixIcon: Icon(Icons.email)),
              ),
              TextFormField(
                onSaved: (newValue) => senha = newValue ?? "",
                decoration: InputDecoration(
                  labelText: "Senha",
                  prefixIcon: Icon(Icons.key),
                  suffixIcon: IconButton(
                    icon: Icon(
                        !visivel ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        visivel = !visivel;
                        print(visivel);
                      });
                    },
                  ),
                ),
                obscureText: !visivel, // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
                obscuringCharacter: "*",
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_key.currentState!.validate()) {
                    _key.currentState!.save();
                    
                    try {
                      await widget.helper.autenticar(email, senha);
                      if (widget.helper.estaIdentificado()){
                        Nagator.pushReplacementNamed
                      }
                     /* if (usuario != null) {
                        widget.appStore.identificado = usuario;
                        Navigator.pushReplacementNamed(context, "/");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Usuário ou senha incorretos!")));
                      }
                    } catch (e) {
                      print(e);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Validação falhou. Tente novamente!")));
                    }
                    */
                  }
                },
                child: const Text("Entrar"),
              )
            ],
          )),
    );
  }
}
