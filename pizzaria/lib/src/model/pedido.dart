import 'package:pizzaria/src/model/cardapio.dart';
import 'package:pizzaria/src/model/usuario.dart';

class Pedido {
  int id;
  Usuario usuario;
  String status;
  String total;
  String dataCriacao;
  List<Cardapio> cardapios;
  String mesa;

  Pedido(
      {this.id,
      this.usuario,
      this.status,
      this.total,
      this.dataCriacao,
      this.cardapios,
      this.mesa});

  Pedido.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usuario =
        json['usuario'] != null ? new Usuario.fromJson(json['usuario']) : null;
    status = json['status'];
    total = json['total'];
    dataCriacao = json['data_criacao'];
    if (json['cardapios'] != null) {
      cardapios = new List<Cardapio>();
      json['cardapios'].forEach((v) {
        cardapios.add(new Cardapio.fromJson(v));
      });
    }
    mesa = json['n_mesa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.usuario != null) {
      data['usuario'] = this.usuario.toJson();
    }
    data['status'] = this.status;
    data['total'] = this.total;
    data['data_criacao'] = this.dataCriacao;
    if (this.cardapios != null) {
      data['cardapios'] = this.cardapios.map((v) => v.toJson()).toList();
    }
    data['n_mesa'] = this.mesa;
    return data;
  }
}

/*List<Pedido> getPedidos() {
  Pedido pedido1 = new Pedido(
      id: 1,
      usuario: null,
      itens: null,
      dataCriacao: "2020/10/08 20:00",
      status: "Entregue");
  Pedido pedido2 = new Pedido(
      id: 2,
      usuario: null,
      itens: null,
      dataCriacao: "2020/10/07 11:30",
      status: "Pendente");
  Pedido pedido3 = new Pedido(
      id: 3,
      usuario: null,
      itens: null,
      dataCriacao: "2020/10/08 12:30",
      status: "Cancelado");
  return [pedido1, pedido2, pedido3];
}*/
