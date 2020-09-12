import 'package:flutter/material.dart';
import 'package:pizzaria/view/login.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  const Splash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SplashScreen(
            seconds: 5,
            navigateAfterSeconds: Login(),
          ),
          Positioned(
            child: Image.asset(
              "imagens/principal.jpg",
              cacheWidth: 550,
              cacheHeight: 1039,
            ),
          ),
          Positioned(
              top: -80,
              left: -80,
              child: Image.asset(
                "imagens/logo_size.png",
                cacheWidth: 600,
              )),
          Positioned(
              top: 500,
              left: 150,
              child: Container(
                width: 150,
                height: 170,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(216, 145, 111, 0.9),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(
                      color: Color.fromRGBO(186, 61, 0, 0.8), width: 6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "imagens/loading-pizza.gif",
                      cacheWidth: 200,
                      cacheHeight: 200,
                      color: Color.fromRGBO(186, 61, 0, 0.8),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
