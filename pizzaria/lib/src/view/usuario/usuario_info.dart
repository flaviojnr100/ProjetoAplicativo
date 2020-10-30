import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/usuario.dart';
import 'package:pizzaria/src/repository/repositoryUsuario.dart';

class UsuarioInfo extends StatefulWidget {
  Usuario usuario;
  RepositoryUsuario repositoryUsuario;
  UsuarioInfo({Key key, this.usuario, this.repositoryUsuario})
      : super(key: key);

  @override
  _UsuarioInfoState createState() => _UsuarioInfoState();
}

class _UsuarioInfoState extends State<UsuarioInfo> {
  @override
  Widget build(BuildContext context) {
    var medida = MediaQuery.of(context).size;
    var _itemSelecionado = widget.usuario.status;

    List<String> status = ['Ativo', 'Desativado'];
    Color mudarCor(var status) {
      if (status == "Ativo") {
        return Colors.green[300];
      } else {
        return Colors.red[300];
      }
    }

    void _trocarValores(String item) {
      setState(() {
        _itemSelecionado = item;
        widget.usuario.status = item;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(186, 61, 0, 1),
        title: Text(
          "Usuário",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
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
                      "${widget.usuario.status}",
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
            padding: const EdgeInsets.only(top: 10, left: 110),
            child: Text(
              "Dados basicos:",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Container(
              width: medida.width * 0.9,
              height: 150,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      offset: Offset(-1, 1),
                      color: Colors.black,
                      blurRadius: 5,
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 40, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Nome: ${widget.usuario.nome}",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Sobrenome:  ${widget.usuario.sobrenome}",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Email: ${widget.usuario.email}",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 140),
            child: Text(
              "Endereço:",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Container(
              width: medida.width * 0.9,
              height: 205,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      offset: Offset(-1, 1),
                      color: Colors.black,
                      blurRadius: 5,
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 40, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Cidade: ${widget.usuario.cidade}",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Bairro: ${widget.usuario.bairro}",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Rua: ${widget.usuario.rua}",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Nº: ${widget.usuario.numero}",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Complemento: ${widget.usuario.complemento}",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 145, top: 10),
            child: Container(
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
                  onPressed: () => {
                        widget.repositoryUsuario
                            .mudarStatus(
                                widget.usuario.id, widget.usuario.status)
                            .whenComplete(() {
                          Navigator.pop(context);
                        })
                      },
                  child: Text(
                    "Salvar",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
