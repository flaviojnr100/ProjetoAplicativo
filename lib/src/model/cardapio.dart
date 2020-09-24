class Cardapio {
  String nome;
  String tipo;
  double preco;
  bool disponibilidade;
  Cardapio({this.nome, this.tipo, this.preco, this.disponibilidade});
}

List<Cardapio> getProdutos() {
  var item1 = Cardapio(
      nome: "4 Quejos", tipo: "Pizza", preco: 45.50, disponibilidade: true);
  var item2 = Cardapio(
      nome: "Mussarela", tipo: "Pizza", preco: 25.00, disponibilidade: true);
  var item3 =
      Cardapio(nome: "Frango", tipo: "Pizza", preco: 18, disponibilidade: true);
  var item4 = Cardapio(
      nome: "Calabreza", tipo: "Pizza", preco: 20, disponibilidade: true);
  var item5 = Cardapio(
      nome: "Portuguesa", tipo: "Pizza", preco: 30, disponibilidade: true);
  var item6 = Cardapio(
      nome: "Italiana", tipo: "Pizza", preco: 25, disponibilidade: true);
  var item7 = Cardapio(
      nome: "Tabirense", tipo: "Pizza", preco: 30, disponibilidade: true);
  List<Cardapio> itens = [item1, item2, item3, item4, item5, item6, item7];
  return itens;
}
