import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/cardapio.dart';
import 'package:pizzaria/src/repository/repositoryCardapio.dart';
import 'package:pizzaria/src/view/cardapio/componentes/cardapio_info.dart';
import 'package:pizzaria/src/view/editarCardapio.dart';

class CardapioCard extends StatelessWidget {
  final Cardapio cardapio;
  final Function onTap;
  final RepositoryCardapio repositoryCardapio;
  const CardapioCard(
      {Key key, this.cardapio, this.onTap, this.repositoryCardapio})
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
                        "${cardapio.id}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100, top: 1),
                      child: FlatButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CardapioInfo(
                                          cardapio: cardapio,
                                          repositoryCardapio:
                                              repositoryCardapio,
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
                    ),
                    FlatButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditarCardapio(
                                        cardapio: cardapio,
                                        repository: repositoryCardapio,
                                      )));
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        label: Text(
                          "Edit",
                          style: TextStyle(color: Colors.black),
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 5),
                      child: Text(
                        "Nome:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 18),
                      child: Text(
                        "${cardapio.nome}",
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
                        "${cardapio.status}",
                        style: TextStyle(
                            color: cor(cardapio.status),
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
