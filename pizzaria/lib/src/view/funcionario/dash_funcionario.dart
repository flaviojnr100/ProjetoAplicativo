import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/usuario.dart';
import 'package:pizzaria/src/repository/repositoryUsuario.dart';
import 'package:pizzaria/src/view/funcionario/componentes/funcionario_card.dart';
import 'package:pizzaria/src/view/usuario/componentes/usuario_card.dart';

class TelaFuncionario extends StatefulWidget {
  TelaFuncionario({Key key}) : super(key: key);
  List<Usuario> getUsuarios = new List();
  @override
  _TelaFuncionarioState createState() => _TelaFuncionarioState();

  RepositoryUsuario repositoryUsuario = new RepositoryUsuario();
}

class _TelaFuncionarioState extends State<TelaFuncionario> {
  bool carregou = false;
  @override
  void initState() {
    super.initState();
    widget.repositoryUsuario.indexFuncionario().whenComplete(() {
      widget.getUsuarios = widget.repositoryUsuario.getFuncionarios;

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
            "Funcionário",
          ),
        ),
        body: Stack(
          children: <Widget>[
            carregou == true
                ? Positioned(
                    child: ListView.builder(
                        itemCount: widget.getUsuarios.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => FuncionarioCard(
                              onTap: () {},
                              usuario: widget.getUsuarios[index],
                              repositoryUsuario: widget.repositoryUsuario,
                            )))
                : widget.getUsuarios.length == 0
                    ? Center(
                        child: Text("Não há funcionarios!"),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
            Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(186, 61, 0, 1),
                        borderRadius: BorderRadius.all(Radius.circular(35)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 15,
                              offset: Offset(-1, 1))
                        ]),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'cadastrarFuncionario');
                      },
                    )))
          ],
        ));
  }
}
