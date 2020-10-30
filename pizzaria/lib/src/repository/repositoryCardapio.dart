import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pizzaria/src/model/cardapio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:pizzaria/src/shared/urls.dart';

class RepositoryCardapio {
  List<Cardapio> cardapios;
  List getCardapios;
  static BaseOptions options = new BaseOptions(
    baseUrl: "${Urls.URL}",
    connectTimeout: 5000,
  );

  RepositoryCardapio() {
    cardapios = new List<Cardapio>();
  }

  var dio = new Dio(options);

  Future cadastrar(Cardapio cardapio, File img) async {
    FormData formData = new FormData.fromMap({
      "nome": cardapio.nome,
      "preco": cardapio.preco,
      "tipo": cardapio.tipo,
      "ingredientes": cardapio.ingredientes,
      "status": cardapio.status
    });
    if (img != null) {
      List caminhos = img.path.split("/");
      formData.files.add(MapEntry(
          "file",
          await MultipartFile.fromFile(img.path,
              filename: "${caminhos[caminhos.length - 1]}",
              contentType: new MediaType(
                  "image", "${caminhos[caminhos.length - 1].split('.')[1]}"))));
    }

    Response response =
        await dio.post("${Urls.CARDAPIO_CADASTRO}", data: formData);
    print(response.statusCode);
  }

  Future editar(Cardapio cardapio, File img) async {
    FormData formData = new FormData.fromMap({
      "id": cardapio.id,
      "nome": cardapio.nome,
      "preco": cardapio.preco,
      "tipo": cardapio.tipo,
      "ingredientes": cardapio.ingredientes,
      "status": cardapio.status
    });
    if (img != null) {
      List caminhos = img.path.split("/");
      formData.files.add(MapEntry(
          "file",
          await MultipartFile.fromFile(img.path,
              filename: "${caminhos[caminhos.length - 1]}",
              contentType: new MediaType(
                  "image", "${caminhos[caminhos.length - 1].split('.')[1]}"))));
    }

    Response response =
        await dio.post("${Urls.CARDAPIO_EDITAR}", data: formData);
    print(response.statusCode);
  }

  Future index() async {
    Response response = await dio.get("${Urls.CARDAPIO_INDEX}");
    for (var dado in response.data['cardapios']) {
      Cardapio cardapio1 = Cardapio.fromJson(dado);

      cardapios.add(cardapio1);
    }
    // print(response.data);
  }

  Future mudarStatus(int id, var status) async {
    FormData form = new FormData.fromMap({'id': id, 'status': status});
    Response response = await dio.post("${Urls.CARDAPIO_STATUS}", data: form);
  }

  Future getAll() async {
    Response response = await dio.get("${Urls.CARDAPIO_GETALLL}");
    List<Cardapio> pizza = pegarDados(response.data['pizzas']);
    List<Cardapio> pocao = pegarDados(response.data['pocoes']);
    List<Cardapio> hamburguer = pegarDados(response.data['hamburgueres']);
    List<Cardapio> bebida = pegarDados(response.data['bebidas']);
    getCardapios = [pizza, hamburguer, pocao, bebida];
  }

  List<Cardapio> pegarDados(var dados) {
    List<Cardapio> cardapios = new List<Cardapio>();
    for (var dado in dados) {
      cardapios.add(Cardapio.fromJson(dado));
    }
    return cardapios;
  }
}

//main(List<String> args) {
//Cardapio cardapio = new Cardapio(
//  nome: "mussarela",
//preco: 20.0,
//ingrediente: "ingre a",
//tipo: "pizza",
//disponibilidade: true,
//urlImg: null);
//RepositoryCardapio repo = new RepositoryCardapio();
//repo.cadastrar(cardapio);
//}
