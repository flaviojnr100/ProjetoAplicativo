import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/usuario.dart';
import 'package:pizzaria/src/repository/repositoryUsuario.dart';
import 'package:pizzaria/src/view/usuario/componentes/usuario_card.dart';

class TelaUsuario extends StatefulWidget {
  TelaUsuario({Key key}) : super(key: key);

  @override
  _TelaUsuarioState createState() => _TelaUsuarioState();

  RepositoryUsuario repositoryUsuario = new RepositoryUsuario();
}

class _TelaUsuarioState extends State<TelaUsuario> {
  List<Usuario> getUsuarios = new List<Usuario>();
  bool carregou = false;
  @override
  void initState() {
    super.initState();
    widget.repositoryUsuario.index().whenComplete(() {
      getUsuarios = widget.repositoryUsuario.getUsuarios;
      carregou = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(186, 61, 0, 1),
        title: Text(
          "Usuário",
        ),
      ),
      body: carregou == true
          ? ListView.builder(
              itemCount: getUsuarios.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => UsuarioCard(
                    onTap: () {},
                    usuario: getUsuarios[index],
                    repositoryUsuario: widget.repositoryUsuario,
                  ))
          : getUsuarios.length == 0
              ? Center(
                  child: Text("Não há usuários!"),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
    );
  }
}
