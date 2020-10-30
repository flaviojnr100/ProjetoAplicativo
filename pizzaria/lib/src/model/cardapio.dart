import 'dart:ffi';

class Cardapio {
  int id;
  String nome;
  String preco;
  String ingredientes;
  String tipo;
  String status;
  String dataCriacao;
  String urlImg;

  Cardapio(
      {this.id,
      this.nome,
      this.preco,
      this.ingredientes,
      this.tipo,
      this.status,
      this.dataCriacao,
      this.urlImg});

  Cardapio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    preco = json['preco'];
    ingredientes = json['ingredientes'];
    tipo = json['tipo'];
    status = json['status'];
    dataCriacao = json['data_criacao'];
    urlImg = json['urlImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['preco'] = this.preco;
    data['ingredientes'] = this.ingredientes;
    data['tipo'] = this.tipo;
    data['status'] = this.status;
    data['data_criacao'] = this.dataCriacao;
    data['urlImg'] = this.urlImg;
    return data;
  }
}
/*
List getProdutos() {
  var item1 = Cardapio(
      nome: "4 Quejos",
      tipo: "Pizza",
      preco: "45.50",
      status: "ativo",
      ingredientes: 'tomate,queixo,cheddar',
      urlImg: "imagens/pizza1.jpg");
  var item2 = Cardapio(
      nome: "Mussarela",
      tipo: "Pizza",
      preco: '25.00',
      status: "ativo",
      ingredientes: 'ingrediente A,ingr B',
      urlImg: "imagens/pizza2.png");
  var item3 = Cardapio(
      nome: "Frango",
      tipo: "Pizza",
      preco: '18',
      status: "ativo",
      ingredientes: 'ingr a,ingre b',
      urlImg: "imagens/pizza3.jpg");
  var item4 = Cardapio(
      nome: "Calabreza",
      tipo: "Pizza",
      preco: '20',
      status: "ativo",
      ingredientes: 'ingr a,ingre b');
  var item5 = Cardapio(
      nome: "Portuguesa",
      tipo: "Pizza",
      preco: '30',
      status: "ativo",
      ingredientes: 'ingr a,ingre b');
  var item6 = Cardapio(
      nome: "Italiana",
      tipo: "Pizza",
      preco: '25',
      status: "ativo",
      ingredientes: 'ingr a,ingre b');
  var item7 = Cardapio(
      nome: "Tabirense",
      tipo: "Pizza",
      preco: '30',
      status: "ativo",
      ingredientes: 'ingr a,ingre b');

  var item8 = Cardapio(
      nome: "X-Burguer",
      status: "ativo",
      preco: '12.0',
      ingredientes: "Hamburguer,pao,cebola",
      tipo: "hamburguer",
      urlImg: "imagens/hamb1.jpg");

  var item9 = Cardapio(
      nome: "X-Bacon",
      status: "ativo",
      preco: '10.0',
      ingredientes: "Hamburguer,pao,bacon",
      tipo: "hamburguer",
      urlImg: "imagens/hamb2.jpg");
  var item10 = Cardapio(
      nome: "X-Salada",
      status: "ativo",
      preco: '9.0',
      ingredientes: "Hamburguer,pao,salada",
      tipo: "hamburguer",
      urlImg: "imagens/hamb3.jpg");
  var item11 = Cardapio(
      nome: "Pocao de batata frita",
      status: "ativo",
      preco: '10.0',
      ingredientes: "batata",
      tipo: "pocao",
      urlImg: "imagens/pocao1.jpg");
  var item12 = Cardapio(
      nome: "Pocao de camarao",
      status: "ativo",
      preco: '10.0',
      ingredientes: "camarâo",
      tipo: "pocao",
      urlImg: "imagens/pocao2.png");
  var item13 = Cardapio(
      nome: "Pocao de batata com cheddar",
      status: "ativo",
      preco: '15.0',
      ingredientes: "batata",
      tipo: "pocao",
      urlImg: "imagens/pocao3.jpeg");
  var item14 = Cardapio(
      nome: "Coca Cola",
      status: "ativo",
      preco: '8.0',
      ingredientes: "gas,coca",
      tipo: "bebida",
      urlImg: "imagens/bebida1.jpg");
  var item15 = Cardapio(
      nome: "Guarana",
      status: "ativo",
      preco: '6.0',
      ingredientes: "gas,agua,guarana",
      tipo: "bebida",
      urlImg: "imagens/bebida2.jpg");
  var item16 = Cardapio(
      nome: "Agua",
      status: "ativo",
      preco: '1.0',
      ingredientes: "agua",
      tipo: "bebida",
      urlImg: "imagens/bebida3.jpg");
  List<Cardapio> itensPizza = [item1, item2, item3, item4, item5, item6, item7];
  List<Cardapio> itensHamburguer = [item8, item9, item10];
  List<Cardapio> itensPocao = [item11, item12, item13];
  List<Cardapio> itensBebida = [item14, item15, item16];
  List produtos = [itensPizza, itensHamburguer, itensPocao, itensBebida];

  return produtos;
}*/
