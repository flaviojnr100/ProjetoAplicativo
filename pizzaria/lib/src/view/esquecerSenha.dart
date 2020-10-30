import 'package:flutter/material.dart';
import 'package:pizzaria/src/repository/repositoryUsuario.dart';

class EsquecerSenha extends StatelessWidget {
  TextEditingController login = new TextEditingController();
  TextEditingController email = new TextEditingController();
  RepositoryUsuario repositoryUsuario = new RepositoryUsuario();
  EsquecerSenha({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var medida = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(186, 61, 0, 1),
        title: Text(
          "Esqueci minha senha",
        ),
      ),
      body: Container(
        width: medida.width,
        height: medida.height,
        color: Color.fromRGBO(217, 217, 217, 1),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -100,
              left: -25,
              child: Image.asset(
                "imagens/logo_size.png",
                cacheWidth: 500,
              ),
            ),
            Positioned(
                top: 310,
                left: 10,
                child: Container(
                  width: medida.width * 0.96,
                  height: 200,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 480,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          border: Border.all(
                              width: 2,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                        ),
                        child: TextField(
                            cursorColor: Colors.red,
                            controller: login,
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
                              width: 2,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                        ),
                        child: TextField(
                            cursorColor: Colors.red,
                            controller: email,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(fontSize: 20),
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.email,
                                size: 30,
                              ),
                              hintText: "Email:",
                            )),
                      ),
                      Divider(),
                      Container(
                        height: 50,
                        width: 150,
                        child: FlatButton(
                          onPressed: () {
                            repositoryUsuario
                                .esqueciSenha(email.text, login.text)
                                .whenComplete(() {
                              if (repositoryUsuario.esqueci == "") {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Aviso"),
                                        content:
                                            Text("Email ou login incorreto!"),
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
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Nova senha"),
                                        content: Text(
                                            "${repositoryUsuario.esqueci}"),
                                        actions: <Widget>[
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.pop(context);
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
                          splashColor: Colors.red,
                          color: Color.fromRGBO(186, 61, 0, 1),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "Gerar senha",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
