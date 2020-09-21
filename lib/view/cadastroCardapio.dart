import 'package:flutter/material.dart';

class CadastroCardapio extends StatefulWidget {
  CadastroCardapio({Key key}) : super(key: key);

  @override
  _CadastroCardapioState createState() => _CadastroCardapioState();
}

class _CadastroCardapioState extends State<CadastroCardapio> {
  var _lista = ['pizza', 'hamburguer', 'poçâo', 'bebida'];
  var _itemSelecionado;
  void _trocarValores(String item) {
    setState(() {
      _itemSelecionado = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    var medida = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(186, 61, 0, 1),
        title: Text(
          "Cardápio",
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 50, top: 30),
                  child: Text(
                    "Dados:",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                  width: medida.width * 0.8,
                  height: 200,
                  margin: EdgeInsets.only(left: medida.width * 0.1, top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromRGBO(186, 61, 0, 1),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset(-5, 5),
                          color: Colors.black,
                          blurRadius: 5,
                        ),
                      ]),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              "Nome:",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Container(
                            width: medida.width * 0.6,
                            height: 50,
                            margin: EdgeInsets.only(top: 10, left: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1,
                                    color: Color.fromRGBO(0, 0, 0, 1)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              "Tipo:",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Container(
                              width: medida.width * 0.45,
                              height: 50,
                              margin: EdgeInsets.only(top: 10, left: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: DropdownButton<String>(
                                hint: Text(
                                  "Selecione um item",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                                items: _lista.map((String dropDownStringItem) {
                                  return DropdownMenuItem<String>(
                                    value: dropDownStringItem,
                                    child: Text(dropDownStringItem),
                                  );
                                }).toList(),
                                onChanged: (item) {
                                  _trocarValores(item);
                                },
                                value: _itemSelecionado,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 10),
                            child: Text(
                              "Preço:",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Container(
                            width: medida.width * 0.6,
                            height: 50,
                            margin: EdgeInsets.only(top: 10, left: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1,
                                    color: Color.fromRGBO(0, 0, 0, 1)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50, top: 20),
                  child: Text(
                    "Imagem:",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                  width: medida.width * 0.8,
                  height: 100,
                  margin: EdgeInsets.only(left: medida.width * 0.1, top: 10),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(186, 61, 0, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset(-5, 5),
                          color: Colors.black,
                          blurRadius: 5,
                        ),
                      ]),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Insira uma imagem:",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(186, 61, 0, 1),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                offset: Offset(-1, 1),
                                color: Colors.black,
                                blurRadius: 5,
                              ),
                            ]),
                        child: FlatButton(
                            onPressed: () => {},
                            child: Text(
                              "Carregar",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  height: 50,
                  margin: EdgeInsets.only(
                      left: medida.width * 0.33, top: medida.height * 0.05),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(186, 61, 0, 1),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset(-1, 1),
                          color: Colors.black,
                          blurRadius: 5,
                        ),
                      ]),
                  child: FlatButton(
                      onPressed: () => {},
                      child: Text(
                        "Concluir",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
