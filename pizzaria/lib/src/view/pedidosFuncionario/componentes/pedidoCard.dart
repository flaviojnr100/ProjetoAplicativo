import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/pedido.dart';
import 'package:pizzaria/src/view/pedidos/pedidoEdit.dart';
import 'package:pizzaria/src/view/pedidos/pedidoInfo.dart';

import '../pedidoInfoFuncionario.dart';

class PedidoCard extends StatelessWidget {
  final Pedido pedido;

  const PedidoCard({Key key, this.pedido}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var medida = MediaQuery.of(context).size;
    return GestureDetector(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: medida.width,
        height: 100,
        decoration: BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 1),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, 0), blurRadius: 5, color: Colors.black54)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    "Codigo:",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 3),
                  child: Text(
                    "${pedido.id}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 200),
                  child: FlatButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PedidoInfoFuncionario(
                                      pedido: pedido,
                                    )));
                      },
                      icon: Icon(
                        Icons.info,
                        color: Colors.black,
                      ),
                      label: Text(
                        'Info',
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 5),
                  child: Text(
                    "Data:",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 18),
                  child: Text(
                    "${pedido.dataCriacao}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18, left: 40),
                  child: Text(
                    "Status:",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18, left: 5),
                  child: Text(
                    "${pedido.status}",
                    style: TextStyle(
                        color: cor(pedido.status),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  Color cor(String status) {
    Color cor;
    switch (status) {
      case "Pendente":
        cor = Colors.blueGrey[300];
        break;
      case "Entregue":
        cor = Colors.green[300];
        break;
      case "Cancelado":
        cor = Colors.red[300];
        break;
      case "Aberto":
        cor = Colors.lightBlue[300];
        break;
      case "Encaminhado":
        cor = Colors.orange[300];
        break;
    }
    return cor;
  }
}
