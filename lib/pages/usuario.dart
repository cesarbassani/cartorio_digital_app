class Usuario {
  String nome;
  String cpf;
  String email;
  String telefone;
  String senha;
  String confirmarSenha;

  Usuario.fromJson(Map<String, dynamic> map) :
    nome = map['user']['nome'],
    cpf = map['user']['cpf'],
    email = map['user']['email'],
    telefone = map['user']['telefone'],
    senha = map['user']['senha'],
    confirmarSenha = map['user']['confirmarSenha'];

  @override
  String toString() {
    return 'Usuario{nome: $nome, cpf: $cpf, email: $email, telefone: $telefone, senha: $senha, confirmarSenha: $confirmarSenha}';
  }
}