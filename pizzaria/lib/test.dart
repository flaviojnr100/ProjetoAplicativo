import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pizzaria/src/model/usuario.dart';

main(List<String> args) {
  BaseOptions options = new BaseOptions(
    baseUrl: "http://127.0.0.1:8000",
    connectTimeout: 5000,
  );

  var dio = new Dio(options);

  void getPessoa() async {
    Response response = await dio.get("/usuario/index");

    // Map<String, dynamic> map = jsonDecode(response.data);
    Usuario usuario = new Usuario.fromJson(response.data);

    print(response.data);
  }

  getPessoa();
}
