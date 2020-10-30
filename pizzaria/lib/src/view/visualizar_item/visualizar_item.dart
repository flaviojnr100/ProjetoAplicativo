import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/cardapio.dart';
import 'package:pizzaria/src/repository/repositoryPedido.dart';
import 'package:pizzaria/src/shared/urls.dart';
import 'package:pizzaria/src/view/dashboard/dashboard.dart';
import 'package:pizzaria/src/view/visualizar_item/componentes/quantidade_pedido.dart';

class VisualizarItem extends StatelessWidget {
  final Cardapio cardapio;
  static int quant = 1;
  RepositoryPedido repositoryPedido = new RepositoryPedido();
  VisualizarItem({Key key, this.cardapio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var medida = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(186, 61, 0, 1),
        title: Text("${cardapio.nome}"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: medida.width,
                    height: medida.height * 0.4,
                    color: Colors.white,
                    child: cardapio.urlImg.runtimeType != Null
                        ? Image.network("${Urls.URL_IMG}" + cardapio.urlImg)
                        : null,
                  ),
                  Container(
                    width: medida.width,
                    height: medida.height * 0.6,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Ingredientes: ${cardapio.ingredientes}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Disponibilidade: ${cardapio.status}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Preço: ${cardapio.preco}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            QuantidadePedido(
                              preco: double.parse(cardapio.preco),
                            ),
                            Container(
                              width: 250,
                              height: 50,
                              margin: EdgeInsets.only(
                                  top: 10, left: medida.width * 0.20),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(186, 61, 0, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Icon(
                                      Icons.add_shopping_cart,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  FlatButton(
                                      onPressed: () {
                                        repositoryPedido
                                            .adicionarPedido(
                                                Dashboard.usuario.id,
                                                cardapio.id,
                                                VisualizarItem.quant)
                                            .whenComplete(() {
                                          Navigator.pop(context);
                                          Navigator.pushReplacementNamed(
                                              context, 'dashUsuario');
                                          VisualizarItem.quant = 1;
                                        });
                                      },
                                      child: Text(
                                        "Adicionar no pedido",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
