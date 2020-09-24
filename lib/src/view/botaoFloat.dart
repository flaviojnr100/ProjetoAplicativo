import 'package:flutter/material.dart';

class BotaoFLoat extends StatefulWidget {
  BotaoFLoat({Key key}) : super(key: key);

  @override
  _BotaoFLoatState createState() => _BotaoFLoatState();
}

class _BotaoFLoatState extends State<BotaoFLoat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.black,
                    width: 400,
                    height: 200,
                  ),
                  Container(
                    color: Colors.red,
                    width: 400,
                    height: 200,
                  ),
                  Container(
                    color: Colors.blue,
                    width: 400,
                    height: 200,
                  ),
                  Container(
                    color: Colors.yellow,
                    width: 400,
                    height: 200,
                  ),
                  Container(
                    color: Colors.green,
                    width: 400,
                    height: 200,
                  ),
                ],
              ),
            ),
          ),
          FlatButton(
            onPressed: () => {},
            child: Icon(
              Icons.fastfood,
            ),
          ),
        ],
      ),
    );
  }
}
