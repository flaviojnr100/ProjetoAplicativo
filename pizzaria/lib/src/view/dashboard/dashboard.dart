import 'package:flutter/material.dart';
import 'package:pizzaria/main.dart';
import 'package:pizzaria/src/model/pedido.dart';
import 'package:pizzaria/src/model/usuario.dart';
import 'package:pizzaria/src/repository/repositoryPedido.dart';
import 'package:pizzaria/src/repository/repositoryUsuario.dart';
import 'package:pizzaria/src/view/dashboard/componentes/itemCardapio.dart';
import 'package:pizzaria/src/view/editarUsuario.dart';
import 'package:pizzaria/src/view/pedidos/pedidoInfo.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);
  static Usuario usuario;
  RepositoryPedido repositoryPedido = new RepositoryPedido();

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isCarregou = true;
  int selecionaIndex = 0;
  Pedido pedido;
  var _categorias = ['Pizza', 'Hamburguer', 'Poção', 'Bebida'];
  final _imagens = [
    'imagens/pizza-icon.png',
    'imagens/hamburger-icon.png',
    'imagens/batatas-fritas-icon.png',
    'imagens/refrigerante-icon.png',
  ];
  @override
  Widget build(BuildContext context) {
    var medida = MediaQuery.of(context).size;
    Pedido pedidoAberto(List<Pedido> pedidos) {
      for (Pedido pedido in pedidos) {
        if (pedido.status == "Aberto") {
          return pedido;
        }
      }
      return null;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(186, 61, 0, 1),
        title: Text(
          "Pizzaria",
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Color.fromRGBO(186, 61, 0, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                "imagens/logo_size.png",
                cacheWidth: 250,
              ),
              Text(
                "${Dashboard.usuario != null ? Dashboard.usuario.nome : ""} ${Dashboard.usuario != null ? Dashboard.usuario.sobrenome : ""}",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              Divider(
                height: 40,
                color: Colors.transparent,
              ),
              Container(
                width: 300,
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'pedidos');
                  },
                  splashColor: Color.fromRGBO(139, 46, 0, 1),
                  child: Text(
                    "Lista de pedidos",
                    style: TextStyle(fontSize: 25, color: Colors.white70),
                  ),
                ),
              ),
              Divider(
                height: 10,
                color: Colors.black45,
              ),
              Container(
                width: 300,
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'editarUsuario');
                  },
                  splashColor: Color.fromRGBO(139, 46, 0, 1),
                  child: Text(
                    "Editar perfil",
                    style: TextStyle(fontSize: 25, color: Colors.white70),
                  ),
                ),
              ),
              Divider(
                height: 10,
                color: Colors.black45,
              ),
              Container(
                width: 300,
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'sobre');
                  },
                  splashColor: Color.fromRGBO(139, 46, 0, 1),
                  child: Text(
                    "Sobre",
                    style: TextStyle(fontSize: 25, color: Colors.white70),
                  ),
                ),
              ),
              Divider(
                height: 10,
                color: Colors.black45,
              ),
              Container(
                width: 300,
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    _showDialog();
                  },
                  splashColor: Color.fromRGBO(139, 46, 0, 1),
                  child: Text(
                    "Encerrar sessão",
                    style: TextStyle(fontSize: 25, color: Colors.white70),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
              child: Column(
            children: <Widget>[
              Text(
                "Cardápio",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                  width: medida.width,
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _categorias.length,
                      itemBuilder: (context, index) =>
                          constroiCategoria(index, _imagens[index]))),
              ItemCardapio(
                selectedIndex: selecionaIndex,
              ),
            ],
          )),
          Positioned(
              right: 30,
              bottom: 20,
              child: Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(186, 61, 0, 1),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 10,
                          color: Colors.black54)
                    ]),
                child: FlatButton(
                    onPressed: () {
                      widget.repositoryPedido
                          .showPedidos(Dashboard.usuario.id)
                          .whenComplete(() {
                        Pedido pe =
                            pedidoAberto(widget.repositoryPedido.pedidos);
                        if (pe != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PedidoInfo(
                                        pedido: pe,
                                      )));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Aviso"),
                                  content: Text("Não há pedido em aberto!"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Ok"),
                                    ),
                                  ],
                                );
                              });
                        }
                      });
                    },
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.fastfood,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            "Pedido",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )),
              ))
          //Positioned(child: ItemCardapio())
        ],

        // Categoria(),
        // ItemCardapio(),
      ),
    );
  }

  Widget constroiCategoria(int index, String imagem) {
    int tamanho = _categorias[index].length * 11 + 40;
    return GestureDetector(
      onTap: () {
        setState(() {
          selecionaIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          width: tamanho.toDouble(),
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black26, style: BorderStyle.solid, width: 1),
              color: selecionaIndex == index
                  ? Color.fromRGBO(186, 61, 0, 1)
                  : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(
                    imagem,
                    cacheWidth: 25,
                    cacheHeight: 25,
                  ),
                  Text(
                    _categorias[index],
                    style: TextStyle(
                        fontSize: 20,
                        color: selecionaIndex == index
                            ? Colors.white
                            : Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Aviso"),
            content: Text("Deseja sair da aplicação ?"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      'login', (Route<dynamic> route) => false);
                },
                child: Text("Sim"),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Não"))
            ],
          );
        });
  }
}
