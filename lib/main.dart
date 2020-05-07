import 'package:flutter/material.dart';
import 'dart:io';
import 'segundapantalla.dart';
import 'sobremi.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MaterialApp(
      home: inicio(),
    ));

class inicio extends StatefulWidget {
  @override
  _inicio createState() => new _inicio();
}

class _inicio extends State<inicio> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      title: new Text(
        'Aplicacion Coronavirus',
        style: new TextStyle(
            fontWeight: FontWeight.bold, fontSize: 40.0, color: Colors.white),
      ),
      photoSize: 120.0,
      seconds: 3,
      backgroundColor: Colors.black,
      image: Image.network(
        "https://img.freepik.com/vector-gratis/logotipo-coronavirus_23-2148496583.jpg?size=626&ext=jpg",
      ),
      navigateAfterSeconds: new Lista(),
    );
  }
}

class Lista extends StatefulWidget {
  @override
  _Lista createState() => _Lista();
}

class _Lista extends State<Lista> {
  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Barra de Opciones"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.center,
              child: MaterialButton(
                highlightColor: Colors.red,
                height: 50.0,
                color: Colors.green,
                child: RichText(
                  text: TextSpan(
                    text: 'Tomar foto',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyApp(
                                dato: "identificar",
                              )));
                },
              )),
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            child: MaterialButton(
              highlightColor: Colors.yellow,
              height: 50.0,
              color: Colors.lightBlueAccent,
              child: RichText(
                text: TextSpan(
                  text: 'Buscar en Galeria',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyApp(
                              dato: "evaluando",
                            )));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            child: MaterialButton(
              highlightColor: Colors.orange,
              height: 50.0,
              color: Colors.deepPurple,
              child: RichText(
                text: TextSpan(
                  text: 'Acerca de Mi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyApp2('GUSTAVO REYES ROMERO', 'TIC 41', '1718110984')));
              },
            ),
          ),
        ],
      ),
    );
  }
}
