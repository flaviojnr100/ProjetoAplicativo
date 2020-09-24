import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/cardapio.dart';
import 'package:pizzaria/src/view/dashboard/componentes/itemCard.dart';

class ItemCardapio extends StatefulWidget {
  ItemCardapio({Key key}) : super(key: key);

  @override
  _ItemCardapioState createState() => _ItemCardapioState();
}

class _ItemCardapioState extends State<ItemCardapio> {
  @override
  Widget build(BuildContext context) {
    var medida = MediaQuery.of(context).size;
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
                itemCount: getProdutos().length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 50,
                    mainAxisSpacing: 30,
                    childAspectRatio: 1),
                itemBuilder: (context, index) => ItemCard(
                      cardapio: getProdutos()[index],
                    ))));
  }
}
