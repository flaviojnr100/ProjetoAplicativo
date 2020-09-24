import 'package:flutter/material.dart';

class Categoria extends StatefulWidget {
  Categoria({Key key}) : super(key: key);

  @override
  _CategoriaState createState() => _CategoriaState();
}

class _CategoriaState extends State<Categoria> {
  var _categorias = ['Pizza', 'Hamburguer', 'Poção', 'Bebida'];
  final _imagens = [
    'imagens/pizza-icon.png',
    'imagens/hamburger-icon.png',
    'imagens/batatas-fritas-icon.png',
    'imagens/refrigerante-icon.png',
  ];
  int selecionaIndex = 0;
  @override
  Widget build(BuildContext context) {
    var medida = MediaQuery.of(context).size;
    return SizedBox(
        width: medida.width,
        height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _categorias.length,
            itemBuilder: (context, index) =>
                constroiCategoria(index, _imagens[index])));
  }

  Widget constroiCategoria(int index, String imagem) {
    int tamanho = _categorias[index].length * 11 + 20;
    return GestureDetector(
      onTap: () {
        setState(() {
          selecionaIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  imagem,
                  cacheWidth: 25,
                  cacheHeight: 25,
                ),
                Text(
                  _categorias[index],
                  style: TextStyle(
                      fontSize: 20,
                      color: selecionaIndex == index
                          ? Color.fromRGBO(186, 61, 0, 1)
                          : Colors.black),
                ),
              ],
            ),
            Container(
              width: tamanho * 1.0,
              height: 2,
              color: selecionaIndex == index
                  ? Color.fromRGBO(186, 61, 0, 1)
                  : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
