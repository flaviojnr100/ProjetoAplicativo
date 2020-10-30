import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/pedido.dart';
import 'package:pizzaria/src/repository/repositoryPedido.dart';
import 'package:pizzaria/src/repository/repositoryUsuario.dart';
import 'package:pizzaria/src/view/dashboard/dashboard.dart';
import 'package:pizzaria/src/view/pedidos/componentes/pedidoCard.dart';

class Pedidos extends StatefulWidget {
  RepositoryPedido repositoryPedido = new RepositoryPedido();
  List getPedidos = new List();

  Pedidos({Key key}) : super(key: key);

  @override
  _PedidosState createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {
  bool carregou = false;
  @override
  void initState() {
    widget.repositoryPedido.showPedidos(Dashboard.usuario.id).whenComplete(() {
      setState(() {
        widget.getPedidos = widget.repositoryPedido.pedidos;
        carregou = true;
        print(widget.getPedidos.length == 0);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(186, 61, 0, 1),
        title: Text(
          "Pedidos",
        ),
      ),
      body: carregou == true
          ? ListView.builder(
              itemCount: widget.getPedidos.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => PedidoCard(
                    pedido: widget.getPedidos[index],
                  ))
          : widget.getPedidos.length == 0
              ? Center(
                  child: Text("Não há pedidos!"),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
    );
  }
}
