import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/cardapio.dart';
import 'package:pizzaria/src/repository/repositoryCardapio.dart';
import 'package:pizzaria/src/view/cardapio/componentes/cardapio_card.dart';

class TelaCadarpio extends StatefulWidget {
  RepositoryCardapio repositoryCardapio = new RepositoryCardapio();
  TelaCadarpio({Key key}) : super(key: key);

  @override
  _TelaCadarpioState createState() => _TelaCadarpioState();
}

class _TelaCadarpioState extends State<TelaCadarpio> {
  List<Cardapio> cardapios = new List();
  bool carregou = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.repositoryCardapio.index().whenComplete(() {
      cardapios = widget.repositoryCardapio.cardapios;
      setState(() {
        carregou = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(186, 61, 0, 1),
          title: Text(
            "Cardapio",
          ),
        ),
        body: Stack(
          children: <Widget>[
            carregou == true
                ? Positioned(
                    child: ListView.builder(
                        itemCount: cardapios.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => CardapioCard(
                              cardapio: cardapios[index],
                              onTap: () {},
                              repositoryCardapio: widget.repositoryCardapio,
                            )))
                : cardapios.length == 0
                    ? Center(
                        child: Text("Não há itens no cardapio!"),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
            Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(186, 61, 0, 1),
                        borderRadius: BorderRadius.all(Radius.circular(35)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 15,
                              offset: Offset(-1, 1))
                        ]),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'cadastarCardapio');
                      },
                    )))
          ],
        ));
  }
}
