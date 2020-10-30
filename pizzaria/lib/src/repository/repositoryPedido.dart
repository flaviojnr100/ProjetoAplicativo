import 'package:dio/dio.dart';
import 'package:pizzaria/src/model/pedido.dart';
import 'package:pizzaria/src/shared/urls.dart';

class RepositoryPedido {
  List<Pedido> pedidos = new List<Pedido>();
  static BaseOptions options = new BaseOptions(
    baseUrl: "${Urls.URL}",
    connectTimeout: 5000,
  );
  var dio = new Dio(options);

  Future index() async {
    Response response = await dio.get("${Urls.PEDIDO_GETALLL}");
    for (var dado in response.data['pedidos']) {
      pedidos.add(Pedido.fromJson(dado));
    }
  }

  Future showPedidos(int id_usuario) async {
    FormData form = FormData.fromMap({'id_usuario': id_usuario});
    Response response = await dio.post("${Urls.PEDIDO_SHOW}", data: form);
    for (var dado in response.data['pedidos']) {
      pedidos.add(Pedido.fromJson(dado));
    }
  }

  Future mudarStatus(int id_pedido, var status) async {
    FormData form =
        new FormData.fromMap({'id_pedido': id_pedido, 'status': status});
    Response response =
        await dio.post("${Urls.PEDIDO_MUDARSTATUS}", data: form);
  }

  Future finalizarPedido(int id_pedido, var status, var total, var mesa) async {
    FormData form = FormData.fromMap({
      'id_pedido': id_pedido,
      'status': status,
      'total': total,
      'n_mesa': mesa
    });
    Response response = await dio.post("${Urls.PEDIDO_FINALIZAR}", data: form);
  }

  Future adicionarPedido(int id_usuario, int id_cardapio, int quant) async {
    for (int i = 0; i < quant; i++) {
      FormData form = new FormData.fromMap(
          {'id_usuario': id_usuario, 'id_cardapio': id_cardapio});
      await dio.post("${Urls.PEDIDO_ADICIONAR}", data: form);
    }
  }

  Future alterarPedido(int id_pedido, var total, var mesa) async {
    FormData form = new FormData.fromMap(
        {'id_pedido': id_pedido, 'total': total, 'n_mesa': mesa});
    Response response = await dio.post("${Urls.PEDIDO_ALTERAR}", data: form);
  }
}
