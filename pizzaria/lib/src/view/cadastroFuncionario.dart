import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/usuario.dart';
import 'package:pizzaria/src/repository/repositoryUsuario.dart';

class CadastroFuncionario extends StatelessWidget {
  RepositoryUsuario repository = RepositoryUsuario();
  TextEditingController nome = TextEditingController();
  TextEditingController sobrenome = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController cidade = TextEditingController();
  TextEditingController bairro = TextEditingController();
  TextEditingController rua = TextEditingController();
  TextEditingController numero = TextEditingController();
  TextEditingController complemento = TextEditingController();
  TextEditingController login = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController senha1 = TextEditingController();
  var tipo = "funcionario";
  var status = "Ativo";
  CadastroFuncionario({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _showDialog(String texto) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Aviso"),
              content: Text("${texto}"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Ok"),
                ),
              ],
            );
          });
    }

    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(186, 61, 0, 1),
          title: Text(
            "Cadastro",
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: 100,
                        height: 30,
                        margin: EdgeInsets.only(left: 20, top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Dados:",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 200,
                      margin: EdgeInsets.only(left: 20, top: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color.fromRGBO(186, 61, 0, 0.9),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black87,
                              offset: Offset(-3, 0),
                              blurRadius: 10,
                            ),
                          ]),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Nome:",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              Container(
                                width: 250,
                                margin: EdgeInsets.only(top: 10, left: 60),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 0.15),
                                    border: Border.all(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 1)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: TextField(
                                  controller: nome,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(fontSize: 15)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Sobrenome:",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              Container(
                                width: 250,
                                margin: EdgeInsets.only(top: 10, left: 10),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 0.15),
                                    border: Border.all(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 1)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: TextField(
                                  controller: sobrenome,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(fontSize: 15)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  "Telefone:",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              Container(
                                width: 250,
                                margin: EdgeInsets.only(top: 10, left: 40),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 0.15),
                                    border: Border.all(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 1)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                child: TextField(
                                  controller: telefone,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(fontSize: 15)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30, left: 35),
                      child: Text(
                        "Endereço: (opcional)",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 350,
                      margin: EdgeInsets.only(left: 20, top: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color.fromRGBO(186, 61, 0, 0.9),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black87,
                              offset: Offset(-3, 0),
                              blurRadius: 10,
                            ),
                          ]),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(
                                      right: 10, left: 10, top: 10),
                                  child: Text(
                                    "Cidade:",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )),
                              Container(
                                width: MediaQuery.of(context).size.width - 150,
                                height: 50,
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 0.15),
                                  border: Border.all(
                                      width: 1,
                                      color: Color.fromRGBO(0, 0, 0, 1)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: TextField(
                                  controller: cidade,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
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
                                  margin: EdgeInsets.only(
                                      right: 10, left: 20, top: 10),
                                  child: Text(
                                    "Bairro:",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )),
                              Container(
                                width: MediaQuery.of(context).size.width - 150,
                                height: 50,
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 0.15),
                                  border: Border.all(
                                      width: 1,
                                      color: Color.fromRGBO(0, 0, 0, 1)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: TextField(
                                  controller: bairro,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
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
                                  margin: EdgeInsets.only(
                                      right: 30, left: 20, top: 10),
                                  child: Text(
                                    "Rua:",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )),
                              Container(
                                width: MediaQuery.of(context).size.width - 150,
                                height: 50,
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 0.15),
                                  border: Border.all(
                                      width: 1,
                                      color: Color.fromRGBO(0, 0, 0, 1)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: TextField(
                                  controller: rua,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
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
                                  margin: EdgeInsets.only(
                                      right: 40, left: 20, top: 10),
                                  child: Text(
                                    "Nº:",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )),
                              Container(
                                width: MediaQuery.of(context).size.width - 150,
                                height: 50,
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 0.15),
                                  border: Border.all(
                                      width: 1,
                                      color: Color.fromRGBO(0, 0, 0, 1)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: TextField(
                                  controller: numero,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
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
                                  margin: EdgeInsets.only(
                                      right: 10, left: 20, top: 10),
                                  child: Text(
                                    "Complemento: (opcional)",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width - 150,
                                height: 50,
                                margin: EdgeInsets.only(top: 10, left: 90),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 0.15),
                                  border: Border.all(
                                      width: 1,
                                      color: Color.fromRGBO(0, 0, 0, 1)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: TextField(
                                  controller: complemento,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
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
                      margin: EdgeInsets.only(top: 20, left: 35),
                      child: Text(
                        "Autenticação:",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 310,
                      margin: EdgeInsets.only(top: 20, left: 20),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(186, 61, 0, 0.9),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black87,
                              offset: Offset(-3, 0),
                              blurRadius: 10,
                            ),
                          ]),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 25, top: 10),
                                child: Text(
                                  "Email:",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              Container(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  height: 50,
                                  margin: EdgeInsets.only(top: 10, left: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 0.15),
                                    border: Border.all(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 1)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: TextField(
                                    controller: email,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 25, top: 10),
                                child: Text(
                                  "Login:",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              Container(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  height: 50,
                                  margin: EdgeInsets.only(top: 10, left: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 0.15),
                                    border: Border.all(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 1)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: TextField(
                                    controller: login,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 20, top: 10),
                                child: Text(
                                  "Senha:",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                              Container(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  height: 50,
                                  margin: EdgeInsets.only(top: 10, left: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 0.15),
                                    border: Border.all(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 1)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: TextField(
                                    controller: senha,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 20, top: 10),
                                child: Text(
                                  "Repita a senha:",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  height: 50,
                                  margin: EdgeInsets.only(top: 10, left: 90),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 0.15),
                                    border: Border.all(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 1)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: TextField(
                                    controller: senha1,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(186, 61, 0, 1),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.black54,
                              offset: Offset(-2, 2),
                            ),
                          ]),
                      margin: EdgeInsets.only(
                          top: 40,
                          bottom: 50,
                          left: MediaQuery.of(context).size.width * 0.35),
                      child: FlatButton(
                          onPressed: () {
                            repository
                                .verifLogin(login.text.trim())
                                .whenComplete(() {
                              if (repository.verificarLogin == false) {
                                if (senha.text.trim() == senha1.text.trim()) {
                                  Usuario u = Usuario(
                                      nome: nome.text.trim(),
                                      sobrenome: sobrenome.text.trim(),
                                      email: email.text.trim(),
                                      telefone: telefone.text.trim(),
                                      cidade: cidade.text.trim(),
                                      bairro: bairro.text.trim(),
                                      rua: rua.text.trim(),
                                      login: login.text.trim(),
                                      senha: senha.text.trim(),
                                      numero: numero.text.trim(),
                                      complemento: complemento.text.trim(),
                                      status: status.trim(),
                                      tipo: tipo.trim());
                                  repository.cadastrar(u).whenComplete(() {
                                    Navigator.pop(context);

                                    Navigator.of(context)
                                        .pushReplacementNamed('funcionarios');
                                  });
                                } else {
                                  _showDialog("As senhas não coincidem!");
                                }
                              } else {
                                _showDialog("Esse login já foi cadastrado!");
                              }
                            });
                          },
                          child: Text(
                            "Concluir",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
