import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'main.dart';



class MyApp extends StatefulWidget {
  var dato;
  MyApp({this.dato});
  @override
  _AppState createState() => _AppState(this.dato);
}

class _AppState extends State<MyApp> {
  var dato;
  _AppState(this.dato);
//Variables de control
  List _salidas;
  File _Imagen;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    loadModel().then((value) {
      setState(() {
        _isLoading = false;
        if (dato=="identificar"){
          openCamera();
        }
        else if(dato=="evaluando"){
          pickImage();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Recognition Flutter"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _isLoading ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ) : Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _Imagen == null ? Container() : Image.file(_Imagen),
                  SizedBox(
                    height: 20.0,
                  ),
                  _salidas != null ? Text("${_salidas[0]["label"]}",
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 20.0,
                      background: Paint()
                        ..color = Colors.white,
                    ),
                  ) : Container(),
                  Padding(padding: EdgeInsets.all(25.0),),
                  Container(
                    padding: EdgeInsets.all(16),
                    //color: Colors.blue,
                    alignment: Alignment.center,
                    child: MaterialButton(
                      highlightColor: Colors.black,
                      child: Text("Inicio"),
                      color: Colors.black12,
                      onPressed: () {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => inicio()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

//Cargar Imagen desde Galería
  pickImage() async {
    var imagen = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imagen == null) return null;
    setState(() {
      _isLoading = true;
      _Imagen = imagen;
    });
    clasificar(imagen);
  }

  clasificar(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 5,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _isLoading = false;
      _salidas = output;
    });
  }

//Cargar Modelo
  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  openCamera() async {
    var imagen = await ImagePicker.pickImage(source: ImageSource.camera);
    if (imagen == null) return null;
    setState(() {
      _isLoading = true;
      _Imagen = imagen;
    });
    clasificar(imagen);
    print(_salidas[0]["label"]);
  }

}
