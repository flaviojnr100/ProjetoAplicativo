import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/usuario.dart';
import 'package:pizzaria/src/repository/repositoryUsuario.dart';
import 'package:pizzaria/src/view/usuario/usuario_info.dart';

import '../funcionario_info.dart';

class FuncionarioCard extends StatelessWidget {
  final Usuario usuario;
  final Function onTap;
  final RepositoryUsuario repositoryUsuario;
  const FuncionarioCard(
      {Key key, this.usuario, this.onTap, this.repositoryUsuario})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color cor(String status) {
      Color cor;
      switch (status) {
        case "Ativo":
          cor = Colors.green[300];
          break;
        case "Desativado":
          cor = Colors.red[300];
          break;
      }
      return cor;
    }

    var medida = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: onTap,
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
                      offset: Offset(0, 0),
                      blurRadius: 5,
                      color: Colors.black54)
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
                        "${usuario.id}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 230, top: 1),
                      child: FlatButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FuncionarioInfo(
                                          usuario: usuario,
                                          repositoryUsuario: repositoryUsuario,
                                        )));
                          },
                          icon: Icon(
                            Icons.info,
                            color: Colors.black,
                          ),
                          label: Text(
                            "Info",
                            style: TextStyle(color: Colors.black),
                          )),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 5),
                      child: Text(
                        "Login:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 18),
                      child: Text(
                        "${usuario.login}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, left: 35),
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
                        "${usuario.status}",
                        style: TextStyle(
                            color: cor(usuario.status),
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
}
