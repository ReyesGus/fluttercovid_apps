import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'main.dart';



class MyApp2 extends StatefulWidget {
  var name;
  var group;
  var id;
  MyApp2(this.name,this.group,this.id);
  @override
  _AppState2 createState() => _AppState2(this.name,this.group,this.id);
}

class _AppState2 extends State<MyApp2> {
  var name;
  var group;
  var id;

  _AppState2(this.name, this.group, this.id);

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Acerca de mi"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(child: Text(name),),
          ],),
          Padding(padding: EdgeInsets.all(10.0),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(child: Text(group),),
            ],),
          Padding(padding: EdgeInsets.all(10.0),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(child: Text(id),),
            ],),
          Padding(padding: EdgeInsets.all(25.0),),
          Container(
            padding: EdgeInsets.all(16),
            //color: Colors.blue,
            alignment: Alignment.center,
            child: MaterialButton(
              highlightColor: Colors.black,
              child: Text("Regresar"),
              color: Colors.black12,
              onPressed: () {
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (context) => inicio()));
              },
            ),
          ),
          ]

      ),
    );
  }
}

