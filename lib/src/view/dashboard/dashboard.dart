import 'package:flutter/material.dart';
import 'package:pizzaria/src/view/dashboard/componentes/categorias.dart';
import 'package:pizzaria/src/view/dashboard/componentes/itemCardapio.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                "Flávio Cordeiro",
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
                  onPressed: () {},
                  splashColor: Color.fromRGBO(139, 46, 0, 1),
                  child: Text(
                    "Inicio",
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
                  onPressed: () {},
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
                  onPressed: () {},
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
                  onPressed: () {},
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
                  onPressed: () {},
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
                style: TextStyle(fontSize: 40),
              ),
              Categoria(),
              ItemCardapio(),
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
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: FlatButton(
                    onPressed: () {},
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
                            "Pedidos",
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
}
