import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/cardapio.dart';
import 'package:pizzaria/src/shared/urls.dart';

class CardapioCard extends StatelessWidget {
  final Cardapio cardapio;

  const CardapioCard({Key key, this.cardapio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var medida = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Container(
        width: medida.width * 0.9,
        height: 100,
        color: Color.fromRGBO(217, 217, 217, 1),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Image.network(
                "${Urls.URL_IMG}" + cardapio.urlImg,
                scale: 2,
                cacheHeight: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "${cardapio.nome} R\$${cardapio.preco}",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
