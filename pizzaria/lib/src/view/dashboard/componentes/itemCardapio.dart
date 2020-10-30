import 'package:flutter/material.dart';
import 'package:pizzaria/src/model/cardapio.dart';
import 'package:pizzaria/src/repository/repositoryCardapio.dart';
import 'package:pizzaria/src/view/dashboard/componentes/itemCard.dart';
import 'package:pizzaria/src/view/visualizar_item/visualizar_item.dart';

class ItemCardapio extends StatefulWidget {
  var selectedIndex;
  RepositoryCardapio repositoryCardapio = new RepositoryCardapio();
  ItemCardapio({Key key, this.selectedIndex}) : super(key: key);

  @override
  _ItemCardapioState createState() => _ItemCardapioState();
}

class _ItemCardapioState extends State<ItemCardapio> {
  bool isLoading = true;
  List getProdutos;
  @override
  void initState() {
    // TODO: implement initState
    widget.repositoryCardapio.getAll().whenComplete(() {
      getProdutos = widget.repositoryCardapio.getCardapios;
      isLoading = false;
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var medida = MediaQuery.of(context).size;

    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                    itemCount: getProdutos[widget.selectedIndex].length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 45,
                        mainAxisSpacing: 30,
                        childAspectRatio: 1),
                    itemBuilder: (context, index) => ItemCard(
                          cardapio: getProdutos[widget.selectedIndex][index],
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VisualizarItem(
                                        cardapio:
                                            getProdutos[widget.selectedIndex]
                                                [index],
                                      ))),
                        ))));
  }
}
