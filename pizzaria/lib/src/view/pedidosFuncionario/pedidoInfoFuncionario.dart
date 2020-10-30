import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/cardapio.dart';
import 'package:pizzaria/src/model/pedido.dart';
import 'package:pizzaria/src/repository/repositoryPedido.dart';

import 'componentes/cardapioCard.dart';

enum opcao { EntregarEndereco, EntregarMesa }

class PedidoInfoFuncionario extends StatefulWidget {
  Pedido pedido;
  RepositoryPedido repositoryPedido = new RepositoryPedido();
  PedidoInfoFuncionario({Key key, this.pedido}) : super(key: key);

  @override
  _PedidoInfoFuncionarioState createState() => _PedidoInfoFuncionarioState();
}

class _PedidoInfoFuncionarioState extends State<PedidoInfoFuncionario> {
  opcao grupo = opcao.EntregarEndereco;
  bool entregarMesa = false;
  TextEditingController n = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var medida = MediaQuery.of(context).size;
    print(widget.pedido.mesa == "");
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
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  "Dados:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  width: medida.width * 0.95,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(217, 217, 217, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "Login: ${widget.pedido.usuario.login}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "Nome: ${widget.pedido.usuario.nome}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "Sobrenome: ${widget.pedido.usuario.sobrenome}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Text(
                  "Entrega:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Container(
                  width: medida.width * 0.95,
                  height: widget.pedido.mesa != "" ? 50 : 200,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(217, 217, 217, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      widget.pedido.mesa == ""
                          ? Text(
                              "",
                              style: TextStyle(fontSize: 1),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 15, top: 12),
                              child: Text(
                                "Mesa: ${widget.pedido.mesa}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                      widget.pedido.mesa != ""
                          ? Text(
                              "",
                              style: TextStyle(fontSize: 1),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                "Cidade: ${widget.pedido.usuario.cidade}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                      widget.pedido.mesa != ""
                          ? Text(
                              "",
                              style: TextStyle(fontSize: 1),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                "Bairro: ${widget.pedido.usuario.bairro}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                      widget.pedido.mesa != ""
                          ? Text(
                              "",
                              style: TextStyle(fontSize: 1),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                "Rua: ${widget.pedido.usuario.rua}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                      widget.pedido.mesa != ""
                          ? Text(
                              "",
                              style: TextStyle(fontSize: 1),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                "Nº: ${widget.pedido.usuario.numero}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                      widget.pedido.mesa != ""
                          ? Text(
                              "",
                              style: TextStyle(fontSize: 1),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 10, top: 5),
                              child: Text(
                                "Complemento: ${widget.pedido.usuario.complemento}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Total: R\$ ${widget.pedido.total}",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              widget.pedido.status == "Entregue"
                  ? Text("")
                  : Container(
                      width: 230,
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
                              Icons.arrow_forward,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          FlatButton(
                              onPressed: () {
                                if (entregarMesa == true) {
                                  widget.pedido.mesa = n.text;
                                }

                                widget.pedido.status = "Encaminhado";
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
                                "Encaminhar pedido",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                        ],
                      ),
                    ),
              widget.pedido.status == "Entregue"
                  ? Text("")
                  : Container(
                      width: 230,
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
                              Icons.check,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          FlatButton(
                              onPressed: () {
                                widget.pedido.status = "Entregue";
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
                                "Pedido entregue",
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
