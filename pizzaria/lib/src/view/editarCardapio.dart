import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pizzaria/src/model/cardapio.dart';
import 'package:pizzaria/src/repository/repositoryCardapio.dart';

class EditarCardapio extends StatefulWidget {
  RepositoryCardapio repository;
  Cardapio cardapio;
  TextEditingController nome = new TextEditingController();
  TextEditingController preco = new TextEditingController();
  TextEditingController ingredientes = new TextEditingController();
  EditarCardapio({this.cardapio, this.repository}) {
    nome.text = cardapio.nome;
    preco.text = cardapio.preco;
    ingredientes.text = cardapio.ingredientes;
  }

  @override
  _CadastroCardapioState createState() => _CadastroCardapioState();
}

class _CadastroCardapioState extends State<EditarCardapio> {
  var _lista = ['pizza', 'hamburguer', 'pocao', 'bebida'];
  File _image;

  var tipo = "";
  var _itemSelecionado;
  void _trocarValores(String item) {
    setState(() {
      _itemSelecionado = item;
      tipo = item;
    });
  }

  @override
  void initState() {
    _trocarValores(widget.cardapio.tipo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var medida = MediaQuery.of(context).size;

    _imgFromCamera() async {
      _image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }

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
                  height: 250,
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
                              controller: widget.nome,
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
                              controller: widget.preco,
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
                              "Ingredientes:",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Container(
                            width: medida.width * 0.4,
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
                              controller: widget.ingredientes,
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
                        _image != null ? "Adicionado" : "Contem uma imagem:",
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
                        child: Container(
                            width: 150,
                            height: 50,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(186, 61, 0, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    offset: Offset(-1, 1),
                                    color: Colors.black,
                                    blurRadius: 5,
                                  ),
                                ]),
                            child: FlatButton.icon(
                                onPressed: () {
                                  _imgFromCamera().whenComplete(() {
                                    setState(() {
                                      print(_image.path);
                                    });
                                  });
                                },
                                icon: Icon(
                                  Icons.file_upload,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Carregar",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ))),
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
                      onPressed: () {
                        widget.cardapio.nome = widget.nome.text;
                        widget.cardapio.ingredientes = widget.ingredientes.text;
                        widget.cardapio.preco = widget.preco.text;
                        widget.cardapio.tipo = _itemSelecionado;
                        //Cardapio cardapio = Cardapio(

                        //  nome: widget.nome.text,
                        //ingredientes: widget.ingredientes.text,
                        //preco: widget.preco.text,
                        //status: "Ativo",
                        //tipo: _itemSelecionado);

                        widget.repository
                            .editar(widget.cardapio, _image)
                            .whenComplete(() {
                          Navigator.pop(context);
                          Navigator.pushReplacementNamed(
                              context, 'telaCardapio');
                        });
                      },
                      child: Text(
                        "Salvar",
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
