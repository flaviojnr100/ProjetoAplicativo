import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/cardapio.dart';
import 'package:pizzaria/src/shared/urls.dart';

class ItemCard extends StatelessWidget {
  final Cardapio cardapio;
  final Function onTap;

  const ItemCard({Key key, this.cardapio, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 100,
          height: 20,
          decoration: BoxDecoration(
              color: Color.fromRGBO(233, 235, 236, 1),
              borderRadius: BorderRadius.all(Radius.circular(30)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    offset: Offset(1, 1), blurRadius: 10, color: Colors.black54)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ClipRRect(
                child: Container(
                  width: 160,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: cardapio.urlImg.runtimeType != Null
                      ? Image.network(
                          "${Urls.URL_IMG}" + cardapio.urlImg,
                          scale: 2,
                          cacheHeight: 250,
                        )
                      : null,
                ),
              ),
              Text(
                "${cardapio.nome}",
                style: TextStyle(fontSize: 20, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              Text(
                "R\$ ${cardapio.preco}",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
