import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/cardapio.dart';
import 'package:pizzaria/src/model/pedido.dart';
import 'package:pizzaria/src/repository/repositoryPedido.dart';

import 'componentes/cardapioCard.dart';

enum opcao { EntregarEndereco, EntregarMesa }

class PedidoInfo extends StatefulWidget {
  Pedido pedido;
  RepositoryPedido repositoryPedido = new RepositoryPedido();
  PedidoInfo({Key key, this.pedido}) : super(key: key);

  @override
  _PedidoInfoState createState() => _PedidoInfoState();
}

class _PedidoInfoState extends State<PedidoInfo> {
  opcao grupo = opcao.EntregarEndereco;
  bool entregarMesa = false;
  TextEditingController n = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var medida = MediaQuery.of(context).size;

    var _itemSelecionado = "Selecione uma opção";
    void _trocarValores(String item) {
      setState(() {
        _itemSelecionado = item;
      });
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(186, 61, 0, 1),
          title: Text(
            "Informação do pedido",
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Text(
                "Itens:",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: medida.width * 0.95,
                height: medida.height * 0.3,
                child: ListView.builder(
                    itemCount: widget.pedido.cardapios.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => CardapioCard(
                          cardapio: widget.pedido.cardapios[index],
                        )),
              ),
              widget.pedido.status != "Aberto"
                  ? Text("")
                  : RadioListTile<opcao>(
                      title: const Text(
                          'Entregar no endereço + (R\$ 4,00 da viagem)'),
                      value: opcao.EntregarEndereco,
                      groupValue: grupo,
                      onChanged: (opcao value) {
                        setState(() {
                          grupo = value;
                          entregarMesa = false;
                        });
                      },
                    ),
              widget.pedido.status != "Aberto"
                  ? Text("")
                  : RadioListTile<opcao>(
                      title: const Text('Entregar na mesa do estabelicimento'),
                      value: opcao.EntregarMesa,
                      groupValue: grupo,
                      onChanged: (opcao value) {
                        setState(() {
                          grupo = value;
                          entregarMesa = true;
                        });
                      },
                    ),
              entregarMesa == true
                  ? Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black26,
                                    style: BorderStyle.solid,
                                    width: 1)),
                            child: TextField(
                              controller: n,
                              decoration: InputDecoration(
                                  hintText: "Digite o Nº da mesa",
                                  border: InputBorder.none),
                            ),
                          ),
                        )
                      ],
                    )
                  : Text(""),
              (widget.pedido.status == "Pendente" ||
                          widget.pedido.status == "Entregue" ||
                          widget.pedido.status == "Encaminhado") &&
                      widget.pedido.mesa == ""
                  ? Text(
                      "                                                  +4,00 da entrega")
                  : widget.pedido.mesa != ""
                      ? Text("Nº da mesa: ${widget.pedido.mesa}",
                          style: TextStyle(fontSize: 30))
                      : Text(""),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Total: R\$ ${widget.pedido.total}",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              widget.pedido.status != "Aberto"
                  ? Text("")
                  : Container(
                      width: 220,
                      height: 50,
                      margin:
                          EdgeInsets.only(top: 10, left: medida.width * 0.01),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(186, 61, 0, 1),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.shopping_cart,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          FlatButton(
                              onPressed: () {
                                if (entregarMesa == false) {
                                  double total =
                                      double.parse(widget.pedido.total) + 4;
                                  widget.pedido.total = total.toString();
                                } else {
                                  widget.pedido.mesa = n.text;
                                }
                                widget.pedido.status = "Pendente";
                                widget.repositoryPedido
                                    .finalizarPedido(
                                        widget.pedido.id,
                                        widget.pedido.status,
                                        widget.pedido.total,
                                        widget.pedido.mesa)
                                    .whenComplete(() {
                                  Navigator.pop(context);
                                });
                              },
                              child: Text(
                                "Finalizar pedido",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                        ],
                      ),
                    ),
              widget.pedido.status == "Cancelado" ||
                      widget.pedido.status == "Encaminhado" ||
                      widget.pedido.status == "Entregue"
                  ? Text("")
                  : Container(
                      width: 220,
                      height: 50,
                      margin:
                          EdgeInsets.only(top: 10, left: medida.width * 0.01),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(186, 61, 0, 1),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.remove_shopping_cart,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          FlatButton(
                              onPressed: () {
                                widget.repositoryPedido
                                    .mudarStatus(widget.pedido.id, "Cancelado")
                                    .whenComplete(() {
                                  Navigator.pop(context);
                                  Navigator.pushReplacementNamed(
                                      context, 'pedidos');
                                });
                              },
                              child: Text(
                                "Cancelar pedido",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 35,
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}
