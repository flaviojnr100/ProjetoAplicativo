import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

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
                      onPressed: () => {},
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
                  RichText(
                    text: TextSpan(
                        recognizer: new TapGestureRecognizer()..onTap = () {},
                        text: "Não lembra da senha?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                        )),
                  ),
                  Divider(),
                  RichText(
                    text: TextSpan(
                        recognizer: new TapGestureRecognizer()..onTap = () {},
                        text: "Não tem cadastro no app?",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                        )),
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
