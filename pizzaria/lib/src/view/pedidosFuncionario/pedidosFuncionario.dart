import 'package:flutter/material.dart';

import 'package:pizzaria/src/repository/repositoryPedido.dart';

import 'package:pizzaria/src/view/pedidosFuncionario/componentes/pedidoCard.dart';

class PedidosFuncionario extends StatefulWidget {
  RepositoryPedido repositoryPedido = new RepositoryPedido();
  List getPedidos = new List();
  bool isLoading = false;
  PedidosFuncionario({Key key}) : super(key: key);

  @override
  _PedidosFuncionarioState createState() => _PedidosFuncionarioState();
}

class _PedidosFuncionarioState extends State<PedidosFuncionario> {
  bool carregou = false;
  @override
  void initState() {
    widget.repositoryPedido.index().whenComplete(() {
      setState(() {
        widget.isLoading = true;
        widget.getPedidos = widget.repositoryPedido.pedidos;
        carregou = true;
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
