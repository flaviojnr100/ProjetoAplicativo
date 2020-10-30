class Usuario {
  int id;
  String nome;
  String sobrenome;
  String telefone;
  String email;
  String cidade;
  String bairro;
  String rua;
  String numero;
  String complemento;
  String login;
  String senha;
  String tipo;
  String status;
  String dataCriacao;

  Usuario(
      {this.id,
      this.nome,
      this.sobrenome,
      this.telefone,
      this.email,
      this.cidade,
      this.bairro,
      this.rua,
      this.numero,
      this.complemento,
      this.login,
      this.senha,
      this.tipo,
      this.status,
      this.dataCriacao});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    sobrenome = json['sobrenome'];
    telefone = json['telefone'];
    email = json['email'];
    cidade = json['cidade'];
    bairro = json['bairro'];
    rua = json['rua'];
    numero = json['numero'];
    complemento = json['complemento'];
    login = json['login'];
    senha = json['senha'];
    tipo = json['tipo'];
    status = json['status'];
    dataCriacao = json['data_criacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['sobrenome'] = this.sobrenome;
    data['telefone'] = this.telefone;
    data['email'] = this.email;
    data['cidade'] = this.cidade;
    data['bairro'] = this.bairro;
    data['rua'] = this.rua;
    data['numero'] = this.numero;
    data['complemento'] = this.complemento;
    data['login'] = this.login;
    data['senha'] = this.senha;
    data['tipo'] = this.tipo;
    data['status'] = this.status;
    data['data_criacao'] = this.dataCriacao;
    return data;
  }
}
