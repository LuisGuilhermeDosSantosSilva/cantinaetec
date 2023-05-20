import 'package:firebase_auth/firebase_auth.dart';

import 'autenticao_email_helper.dart';
class AutenticacaoEmailFirebase extends AutenticacaoEmailHelper{

  @override
  autenticar(String email, String senha) {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: senha);  
    
  }

  @override
  Future<void> recuperarSenha() {
    // TODO: implement recuperarSenha
    throw UnimplementedError();
  }

  @override
  Future<void> registrar(String email, String senha) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: senha);
 
  }


  @override
  bool estaIdentificado(){
    return FirebaseAuth.instance.currentUser!=null;
  }
}