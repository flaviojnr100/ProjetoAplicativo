import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/cardapio.dart';
import 'package:pizzaria/src/model/usuario.dart';

import 'package:pizzaria/src/view/cadastroCardapio.dart';
import 'package:pizzaria/src/view/cadastroFuncionario.dart';
import 'package:pizzaria/src/view/cadastroUsuario.dart';
import 'package:pizzaria/src/view/cardapio/componentes/cardapio_info.dart';
import 'package:pizzaria/src/view/cardapio/dash_cardapio.dart';
import 'package:pizzaria/src/view/dashboardFuncionario/dashboardFuncionario.dart';
import 'package:pizzaria/src/view/editarUsuario.dart';
import 'package:pizzaria/src/view/esquecerSenha.dart';
import 'package:pizzaria/src/view/funcionario/dash_funcionario.dart';
import 'package:pizzaria/src/view/pedidos/pedidoInfo.dart';
import 'package:pizzaria/src/view/pedidos/pedidos.dart';
import 'package:pizzaria/src/view/pedidosFuncionario/pedidosFuncionario.dart';
import 'package:pizzaria/src/view/sobre.dart';
import 'package:pizzaria/src/view/usuario/componentes/usuario_card.dart';
import 'package:pizzaria/src/view/usuario/usuario_info.dart';
import 'package:pizzaria/src/view/usuario/dash_usuario.dart';
import 'package:pizzaria/src/view/visualizar_item/visualizar_item.dart';
import 'package:pizzaria/test.dart';
import 'package:pizzaria/src/view/dashboard/dashboard.dart';
import 'package:pizzaria/src/view/splash.dart';
import 'package:pizzaria/src/view/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> rotas = {
      'login': (_) => Login(),
      'dashUsuario': (_) => Dashboard(),
      'dashFuncionario': (_) => DashboardFuncionario(),
      'telaUsuario': (_) => TelaUsuario(),
      'telaCardapio': (_) => TelaCadarpio(),
      'cadastarCardapio': (_) => CadastroCardapio(),
      'cadastrarUsuario': (_) => CadastroUsuario(),
      'cadastrarFuncionario': (_) => CadastroFuncionario(),
      'funcionarios': (_) => TelaFuncionario(),
      'editarUsuario': (_) => EditarUsuario(usuario: Dashboard.usuario),
      'pedidos': (_) => Pedidos(),
      'pedidosFuncionario': (_) => PedidosFuncionario(),
      'sobre': (_) => Sobre(),
      'esquecerSenha': (_) => EsquecerSenha(),
    };
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: rotas,
        debugShowCheckedModeBanner: false,
        home: Login());
  }
}
