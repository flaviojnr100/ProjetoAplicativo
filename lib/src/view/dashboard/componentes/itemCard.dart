import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/cardapio.dart';

class ItemCard extends StatelessWidget {
  final Cardapio cardapio;

  const ItemCard({Key key, this.cardapio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 100,
        height: 20,
        decoration: BoxDecoration(
          color: Color.fromRGBO(233, 235, 236, 1),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              "${cardapio.nome}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Preço: R\$ ${cardapio.preco}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
