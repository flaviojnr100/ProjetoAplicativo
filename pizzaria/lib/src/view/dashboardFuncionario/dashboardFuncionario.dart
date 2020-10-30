import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/usuario.dart';
import 'package:pizzaria/src/repository/repositoryDashFuncionario.dart';
import 'package:pizzaria/src/repository/repositoryUsuario.dart';

class DashboardFuncionario extends StatefulWidget {
  DashboardFuncionario({Key key}) : super(key: key);
  RepositoryUsuario repoUsuario = new RepositoryUsuario();
  RepositoryDashFuncionario repoDash = new RepositoryDashFuncionario();
  int totalPedidosPendentes = 0;
  int totalPedidosEntregues = 0;
  int totalUsuariosAtivos = 0;
  int totalItensCardapio = 0;
  static bool isAdm = false;
  static Usuario usuario;
  @override
  _DashboardFuncionarioState createState() => _DashboardFuncionarioState();
}

class _DashboardFuncionarioState extends State<DashboardFuncionario> {
  @override
  void initState() {
    widget.repoDash.index().whenComplete(() {
      widget.totalPedidosPendentes = widget.repoDash.totalPedidosPendentes;
      widget.totalPedidosEntregues = widget.repoDash.totalPedidosEntregues;
      widget.totalUsuariosAtivos = widget.repoDash.totalUsuariosAtivos;
      widget.totalItensCardapio = widget.repoDash.totalItensCardapio;

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var medida = MediaQuery.of(context).size;

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
                DashboardFuncionario.isAdm == true
                    ? "Administrador"
                    : DashboardFuncionario.usuario != null
                        ? "${DashboardFuncionario.usuario.nome} ${DashboardFuncionario.usuario.sobrenome}"
                        : "",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              Divider(
                height: 40,
                color: Colors.transparent,
              ),
              DashboardFuncionario.isAdm != false
                  ? Text(
                      "",
                      style: TextStyle(fontSize: 1),
                    )
                  : Container(
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
              DashboardFuncionario.isAdm != false
                  ? Text(
                      "",
                      style: TextStyle(fontSize: 1),
                    )
                  : Divider(
                      height: 10,
                      color: Colors.black45,
                    ),
              Container(
                width: 300,
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'pedidosFuncionario');
                  },
                  splashColor: Color.fromRGBO(139, 46, 0, 1),
                  child: Text(
                    "Pedido",
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
                    Navigator.pushNamed(context, 'telaCardapio');
                  },
                  splashColor: Color.fromRGBO(139, 46, 0, 1),
                  child: Text(
                    "Cardapio",
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
                    Navigator.pushNamed(context, "telaUsuario");
                  },
                  splashColor: Color.fromRGBO(139, 46, 0, 1),
                  child: Text(
                    "Usuário",
                    style: TextStyle(fontSize: 25, color: Colors.white70),
                  ),
                ),
              ),
              DashboardFuncionario.isAdm == false
                  ? Text(
                      "",
                      style: TextStyle(fontSize: 1),
                    )
                  : Divider(
                      height: 10,
                      color: Colors.black45,
                    ),
              DashboardFuncionario.isAdm == false
                  ? Text(
                      "",
                      style: TextStyle(fontSize: 1),
                    )
                  : Container(
                      width: 300,
                      height: 50,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'funcionarios');
                        },
                        splashColor: Color.fromRGBO(139, 46, 0, 1),
                        child: Text(
                          "Funcionário",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 100, top: 15),
            child: Text(
              "Dashboard",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30),
                  child: Container(
                    width: medida.width * 0.4,
                    height: medida.width * 0.4,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(186, 61, 0, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 10,
                              color: Colors.black54)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "Pedidos pendentes:",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            "${widget.totalPedidosPendentes}",
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30),
                  child: Container(
                    width: medida.width * 0.4,
                    height: medida.width * 0.4,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(186, 61, 0, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 10,
                              color: Colors.black54)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            "Pedidos entregues:",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            "${widget.totalPedidosEntregues}",
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Container(
                  width: medida.width * 0.4,
                  height: medida.width * 0.4,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(186, 61, 0, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 10,
                            color: Colors.black54)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          "Usuários ativos:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "${widget.totalUsuariosAtivos}",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30),
                child: Container(
                  width: medida.width * 0.4,
                  height: medida.width * 0.4,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(186, 61, 0, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 10,
                            color: Colors.black54)
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          "Itens no cardápio:",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          "${widget.totalItensCardapio}",
                          style: TextStyle(color: Colors.white, fontSize: 50),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
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
                  DashboardFuncionario.isAdm = false;
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
