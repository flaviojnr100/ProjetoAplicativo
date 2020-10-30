import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/usuario.dart';

import 'package:pizzaria/src/repository/repositoryUsuario.dart';
import 'package:pizzaria/src/view/dashboard/dashboard.dart';
import 'package:pizzaria/src/view/dashboardFuncionario/dashboardFuncionario.dart';

class Login extends StatelessWidget {
  Login({Key key}) : super(key: key);
  RepositoryUsuario repository = RepositoryUsuario();
  TextEditingController loginAuth = TextEditingController();
  TextEditingController senhaAuth = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          new Positioned(
              top: 0,
              left: 0,
              child: Container(
                color: Colors.black,
                height: mediaQuery.size.height,
                width: mediaQuery.size.width,
                child: Image.asset(
                  "imagens/principal-embacada.png",
                  cacheWidth: mediaQuery.size.width.toInt() + 60,
                  cacheHeight: mediaQuery.size.height.toInt() + 114,
                ),
              )),
          new Positioned(
              top: -100,
              left: -30,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    "imagens/logo_size.png",
                    cacheWidth: 500,
                  ),
                ],
              )),
          new Positioned(
            top: 300,
            left: 20,
            child: Container(
              height: mediaQuery.size.height - 450,
              width: mediaQuery.size.width - 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromRGBO(240, 240, 240, 0.7),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Entrar",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 60,
                    ),
                  ),
                  Divider(
                    height: 16,
                  ),
                  Container(
                    width: 480,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                          width: 2, color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                    child: TextField(
                        cursorColor: Colors.red,
                        controller: loginAuth,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.person,
                            size: 30,
                          ),
                          hintText: "Login:",
                        )),
                  ),
                  Divider(),
                  Container(
                    width: 480,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                          width: 2, color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                    child: TextField(
                        cursorColor: Colors.red,
                        controller: senhaAuth,
                        style: TextStyle(color: Colors.black),
                        obscureText: true,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 20),
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.https,
                            size: 30,
                          ),
                          hintText: "Senha:",
                        )),
                  ),
                  Divider(),
                  Container(
                    height: 50,
                    width: 150,
                    child: FlatButton(
                      onPressed: () {
                        Usuario usuario = Usuario(
                            login: loginAuth.text.trim(),
                            senha: senhaAuth.text.trim());
                        if (loginAuth.text == "adm" &&
                            senhaAuth.text == "adm") {
                          DashboardFuncionario.isAdm = true;
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DashboardFuncionario()));
                        } else {
                          repository.validarLogin(usuario).whenComplete(() {
                            if (repository.verif == true) {
                              if (repository.usuario.tipo == "usuario") {
                                Dashboard.usuario = repository.usuario;
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Dashboard()));
                              } else if (repository.usuario.tipo ==
                                  "funcionario") {
                                DashboardFuncionario.usuario =
                                    repository.usuario;
                                Dashboard.usuario = repository.usuario;
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DashboardFuncionario()));
                              }
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Aviso"),
                                      content: Text(
                                          "Login e senha invalido ou login não permitido!"),
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
                        }
                      },
                      splashColor: Colors.red,
                      color: Color.fromRGBO(186, 61, 0, 1),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'esquecerSenha');
                    },
                    child: Text(
                      "Não lembra da senha?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Divider(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "cadastrarUsuario");
                    },
                    child: Text(
                      "Não tem cadastro no app?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
