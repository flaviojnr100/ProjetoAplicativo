import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var medida = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(186, 61, 0, 1),
        title: Text(
          "Sobre",
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Image.asset(
              "imagens/principal.jpg",
              cacheWidth: 653,
              cacheHeight: 1113,
            ),
          ),
          Positioned(
              top: -110,
              left: -80,
              child: Image.asset(
                "imagens/logo_size.png",
                cacheWidth: 600,
              )),
          Positioned(
              top: 350,
              left: 1,
              child: Container(
                width: medida.width * 1,
                height: medida.height * 0.5,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(186, 61, 0, 1),
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(380)),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 80, left: 110),
                      child: Text(
                        "Versão: 1.0.0",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70, left: 105),
                      child: Text(
                        "Aplicativo de gerenciamento de cardápio",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 70, left: 105),
                      child: Text(
                        "copyright © 2020 todos os direitos reservados",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
