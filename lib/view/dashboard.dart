import 'package:flutter/material.dart';

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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFixedExtentList(
              delegate: SliverChildListDelegate([
                Stack(
                  children: <Widget>[
                    Positioned(
                        top: 10,
                        left: 130,
                        child: Container(
                            color: Colors.transparent,
                            width: 200,
                            height: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Cardápio",
                                  style: TextStyle(
                                    fontSize: 40,
                                  ),
                                )
                              ],
                            ))),
                    Positioned(
                      top: 77,
                      left: MediaQuery.of(context).size.width * 0.10,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "imagens/pizza-icon.png",
                              cacheWidth: 25,
                            ),
                            Text(
                              "Pizzas",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 100,
                        left: MediaQuery.of(context).size.width * 0.10,
                        child: Container(
                          width: 360,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color.fromRGBO(231, 234, 237, 1),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(10, 10),
                                  blurRadius: 10,
                                ),
                              ]),
                        )),
                    Positioned(
                      top: 277,
                      left: MediaQuery.of(context).size.width * 0.10,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "imagens/hamburger-icon.png",
                              cacheWidth: 28,
                            ),
                            Text(
                              "hambúrgueres",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 300,
                        left: MediaQuery.of(context).size.width * 0.10,
                        child: Container(
                          width: 360,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color.fromRGBO(231, 234, 237, 1),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(10, 10),
                                  blurRadius: 10,
                                ),
                              ]),
                        )),
                    Positioned(
                      top: 477,
                      left: MediaQuery.of(context).size.width * 0.10,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "imagens/batatas-fritas-icon.png",
                              cacheWidth: 25,
                            ),
                            Text(
                              "Porções",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 500,
                        left: MediaQuery.of(context).size.width * 0.10,
                        child: Container(
                          width: 360,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color.fromRGBO(231, 234, 237, 1),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(10, 10),
                                  blurRadius: 10,
                                ),
                              ]),
                        )),
                    Positioned(
                      top: 677,
                      left: MediaQuery.of(context).size.width * 0.10,
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "imagens/refrigerante-icon.png",
                              cacheWidth: 30,
                            ),
                            Text(
                              "Bebidas",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 700,
                        left: MediaQuery.of(context).size.width * 0.10,
                        child: Container(
                          width: 360,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color.fromRGBO(231, 234, 237, 1),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(10, 10),
                                  blurRadius: 10,
                                ),
                              ]),
                        )),
                  ],
                ),
              ]),
              itemExtent: 1000)
        ],
      ),
    );
  }
}
