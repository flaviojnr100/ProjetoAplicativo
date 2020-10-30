import 'package:dio/dio.dart';
import 'package:pizzaria/src/shared/urls.dart';

class RepositoryDashFuncionario {
  int totalPedidosPendentes;
  int totalPedidosEntregues;
  int totalUsuariosAtivos;
  int totalItensCardapio;

  static BaseOptions options = new BaseOptions(
    baseUrl: "${Urls.URL}",
    connectTimeout: 5000,
  );
  var dio = new Dio(options);
  Future index() async {
    Response response = await dio.get("${Urls.DASH_FUNCIONARIO}");
    totalPedidosPendentes = response.data['t_pedidosPendentes'];
    totalPedidosEntregues = response.data['t_pedidosEntregues'];
    totalUsuariosAtivos = response.data['t_usuarios'];
    totalItensCardapio = response.data['t_cardapios'];
  }
}
