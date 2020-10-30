import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:pizzaria/src/model/usuario.dart';
import 'package:pizzaria/src/shared/urls.dart';

class RepositoryUsuario {
  Usuario usuario;
  List<Usuario> getUsuarios = new List<Usuario>();
  List<Usuario> getFuncionarios = new List<Usuario>();
  bool verif = false;
  bool verificarLogin = false;
  var esqueci;
  static BaseOptions options = new BaseOptions(
    baseUrl: "${Urls.URL}",
    connectTimeout: 5000,
  );

  var dio = new Dio(options);

  Future cadastrar(Usuario usuario) async {
    FormData form = new FormData.fromMap(usuario.toJson());
    Response response = await dio.post("${Urls.USUARIO_CADASTRO}", data: form);
  }

  Future<Response> editar(Usuario usuario) async {
    FormData form = new FormData.fromMap(usuario.toJson());
    Response response = await dio.post("${Urls.USUARIO_EDITAR}", data: form);
  }

  Future index() async {
    Response response = await dio.get("${Urls.USUARIO_INDEX}");

    for (var dado in response.data['usuarios']) {
      Usuario usuario = Usuario.fromJson(dado);
      getUsuarios.add(usuario);
    }
  }

  Future indexFuncionario() async {
    Response response = await dio.get("${Urls.FUNCIONARIO_INDEX}");

    for (var dado in response.data['usuarios']) {
      Usuario usuario = Usuario.fromJson(dado);
      getFuncionarios.add(usuario);
    }
  }

  Future mudarStatus(int id, String status) async {
    FormData form = new FormData.fromMap({'id': id, 'status': status});
    Response response = await dio.post("${Urls.USUARIO_STATUS}", data: form);
  }

  Future validarLogin(Usuario usuario) async {
    FormData form =
        FormData.fromMap({'login': usuario.login, 'senha': usuario.senha});
    Response response = await dio.post("${Urls.VALIDAR_LOGIN}", data: form);

    if (response.data['flag']) {
      Map<String, dynamic> dados = response.data['dados'];
      this.usuario = Usuario.fromJson(dados);
    }

    verif = response.data['flag'];
  }

  Future verifLogin(var login) async {
    FormData form = FormData.fromMap({'login': login});
    Response response = await dio.post("${Urls.VERIFICAR_LOGIN}", data: form);

    verificarLogin = response.data['flag'];
  }

  Future verifLoginEditar(var login, var temp) async {
    FormData form = FormData.fromMap({'login': login, 'temp_login': temp});
    Response response =
        await dio.post("${Urls.VERIFICAR_LOGIN_EDITAR}", data: form);

    verificarLogin = response.data['flag'];
  }

  Future esqueciSenha(var email, var login) async {
    FormData form = new FormData.fromMap({'email': email, 'login': login});
    Response response = await dio.post("${Urls.USUARIO_ESQUECI}", data: form);
    esqueci = response.data['senha'];
  }
}
