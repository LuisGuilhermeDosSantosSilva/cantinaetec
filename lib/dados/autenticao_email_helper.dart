abstract class AutenticacaoEmailHelper{

  Future<void>  registrar(String email, String senha);
  Future<void> autenticar(String email, String senha);
  Future<void> recuperarSenha();
  bool estaIdentificado();
}