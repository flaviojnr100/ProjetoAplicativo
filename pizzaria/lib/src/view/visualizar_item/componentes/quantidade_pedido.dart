import 'package:flutter/material.dart';
import 'package:pizzaria/src/view/visualizar_item/visualizar_item.dart';

class QuantidadePedido extends StatefulWidget {
  final double preco;
  QuantidadePedido({Key key, this.preco}) : super(key: key);

  @override
  _QuantidadePedidoState createState() => _QuantidadePedidoState();
}

class _QuantidadePedidoState extends State<QuantidadePedido> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 100,
      margin: EdgeInsets.only(top: 100, left: 10),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Total: ${VisualizarItem.quant * widget.preco}0",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 235, 236, 1),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: FlatButton(
                    onPressed: () {
                      setState(() {
                        VisualizarItem.quant > 1 ? VisualizarItem.quant-- : 1;
                      });
                    },
                    child: Text(
                      "-",
                      style: TextStyle(fontSize: 25),
                    )),
              ),
              Container(
                  width: 50,
                  height: 50,
                  padding: EdgeInsets.only(left: 20, top: 18),
                  child: Text("${VisualizarItem.quant}")),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 235, 236, 1),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: FlatButton(
                    onPressed: () {
                      setState(() {
                        VisualizarItem.quant++;
                      });
                    },
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 25),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
