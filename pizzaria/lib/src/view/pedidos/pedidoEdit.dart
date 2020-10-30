import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/cardapio.dart';
import 'package:pizzaria/src/model/pedido.dart';
import 'package:pizzaria/src/repository/repositoryPedido.dart';

import 'componentes/cardapioCard.dart';

enum opcao { EntregarEndereco, EntregarMesa }

class PedidoEdit extends StatefulWidget {
  Pedido pedido;
  double total = 0;

  RepositoryPedido repositoryPedido = new RepositoryPedido();
  bool entregarMesa = false;
  TextEditingController n = new TextEditingController();
  opcao grupo;
  PedidoEdit({Key key, this.pedido}) : super(key: key);

  @override
  _PedidoEditState createState() => _PedidoEditState();
}

class _PedidoEditState extends State<PedidoEdit> {
  @override
  void initState() {
    super.initState();
    widget.pedido.mesa == ""
        ? widget.grupo = opcao.EntregarEndereco
        : widget.grupo = opcao.EntregarMesa;

    widget.total = double.parse(widget.pedido.total);
    widget.n.text = widget.pedido.mesa;
  }

  @override
  Widget build(BuildContext context) {
    var medida = MediaQuery.of(context).size;
    //

    widget.pedido.mesa == ""
        ? widget.entregarMesa = false
        : widget.entregarMesa = true;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(186, 61, 0, 1),
          title: Text(
            "Editar pedido",
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
              RadioListTile<opcao>(
                title:
                    const Text('Entregar no endereço + (R\$ 4,00 da viagem)'),
                value: opcao.EntregarEndereco,
                groupValue: widget.grupo,
                selected: widget.grupo == opcao.EntregarEndereco ? true : false,
                onChanged: (opcao value) {
                  setState(() {
                    widget.grupo = value;
                    widget.grupo = opcao.EntregarEndereco;
                    widget.entregarMesa = false;

                    widget.total += 4;
                  });
                },
              ),
              RadioListTile<opcao>(
                title: const Text('Entregar na mesa do estabelicimento'),
                value: opcao.EntregarMesa,
                groupValue: widget.grupo,
                selected: widget.grupo == opcao.EntregarMesa ? true : false,
                onChanged: (opcao value) {
                  setState(() {
                    widget.grupo = value;

                    widget.entregarMesa = true;

                    widget.total -= 4;
                  });
                },
              ),
              widget.grupo == opcao.EntregarMesa
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
                              controller: widget.n,
                              decoration: InputDecoration(
                                  hintText: "Digite o Nº da mesa",
                                  border: InputBorder.none),
                            ),
                          ),
                        )
                      ],
                    )
                  : Text(""),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Total: R\$ ${widget.total}",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              widget.pedido.status == "Encaminhado" ||
                      widget.pedido.status == "Cancelado" ||
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
                              Icons.shopping_cart,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          FlatButton(
                              onPressed: () {
                                if (widget.grupo == opcao.EntregarEndereco) {
                                  widget.pedido.mesa = "";
                                } else {
                                  widget.pedido.mesa = widget.n.text;
                                }

                                widget.pedido.total = widget.total.toString();
                                widget.repositoryPedido
                                    .alterarPedido(widget.pedido.id,
                                        widget.pedido.total, widget.pedido.mesa)
                                    .whenComplete(() {
                                  Navigator.pop(context);
                                });
                              },
                              child: Text(
                                "Salvar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )),
                        ],
                      ),
                    ),
              widget.pedido.status == "Encaminhado" ||
                      widget.pedido.status == "Cancelado" ||
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
