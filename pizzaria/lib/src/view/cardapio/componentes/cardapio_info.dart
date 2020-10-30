import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/cardapio.dart';
import 'package:pizzaria/src/repository/repositoryCardapio.dart';
import 'package:pizzaria/src/shared/urls.dart';

class CardapioInfo extends StatefulWidget {
  Cardapio cardapio;
  RepositoryCardapio repositoryCardapio;
  CardapioInfo({Key key, this.cardapio, this.repositoryCardapio})
      : super(key: key);

  @override
  _CardapioInfoState createState() => _CardapioInfoState();
}

class _CardapioInfoState extends State<CardapioInfo> {
  List<String> status = ['Ativo', 'Desativado'];
  @override
  Widget build(BuildContext context) {
    var medida = MediaQuery.of(context).size;
    var _itemSelecionado = widget.cardapio.status;
    void _trocarValores(String item) {
      setState(() {
        _itemSelecionado = item;
        widget.cardapio.status = item;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(186, 61, 0, 1),
        title: Text(
          "Cardapio",
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    "Status: ",
                    style: TextStyle(fontSize: 25),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: DropdownButton<String>(
                      hint: Text(
                        "${widget.cardapio.status}",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      items: status.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (item) {
                        _trocarValores(item);
                      },
                      value: _itemSelecionado,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 10),
              child: Image.network(
                "${Urls.URL_IMG}" + widget.cardapio.urlImg,
                scale: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, top: 20),
              child: Container(
                width: medida.width * 0.8,
                height: medida.height * 0.35,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(218, 220, 235, 1),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20),
                      child: Row(
                        children: <Widget>[
                          Text("Nome: ", style: TextStyle(fontSize: 25)),
                          Text(
                            "${widget.cardapio.nome}",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: <Widget>[
                          Text("Ingredientes: ",
                              style: TextStyle(fontSize: 25)),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        SizedBox(
                          width: 290,
                          height: 100,
                          child: Text("${widget.cardapio.ingredientes}",
                              style: TextStyle(fontSize: 20)),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 40),
                      child: Row(
                        children: <Widget>[
                          Text("Preço: ", style: TextStyle(fontSize: 25)),
                          Text("${widget.cardapio.preco}",
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: <Widget>[
                          Text("Tipo: ", style: TextStyle(fontSize: 25)),
                          Text("${widget.cardapio.tipo}",
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 150),
              child: Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(186, 61, 0, 1),
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 15,
                            offset: Offset(-1, 1))
                      ]),
                  child: FlatButton(
                      onPressed: () {
                        widget.repositoryCardapio
                            .mudarStatus(
                                widget.cardapio.id, widget.cardapio.status)
                            .whenComplete(() {
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(
                              context, 'telaCardapio');
                        });
                      },
                      child: Text(
                        "Salvar",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
