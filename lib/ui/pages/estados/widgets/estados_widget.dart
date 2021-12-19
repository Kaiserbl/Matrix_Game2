import 'dart:io';

import 'package:Matrix_Game2/domain/controller/auth_controller.dart';
import 'package:Matrix_Game2/domain/controller/firestore.dart';
import 'package:Matrix_Game2/domain/controller/image_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// Widget que permite crear un estado
class AgregarEstado extends StatefulWidget {
  @override
  _AgregarEstadoState createState() => _AgregarEstadoState();
}

class _AgregarEstadoState extends State<AgregarEstado> {
  TextEditingController controltitulo = TextEditingController();
  TextEditingController controldetalle = TextEditingController();
  ControllerFirestore controlestados = Get.find();
  AuthenticationController controluser = Get.find();

  ImagePicker picker = ImagePicker();
  var _image;

  _galeria() async {
    XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = (image != null) ? File(image.path) : null;
    });
  }

  _camara() async {
    XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = (image != null) ? File(image.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    Image_Control image = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[700],
        title: Text("Crear Estado"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Obx(
                () => Image.asset(
                  image.imagen,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15, 100, 0, 0),
              child: Container(
                width: 380,
                height: 600,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              _opcioncamara(context);
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              height: 220,
                              width: double.maxFinite,
                              child: Card(
                                elevation: 5,
                                child: _image != null
                                    ? Image.file(
                                        _image,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.fitHeight,
                                      )
                                    : Icon(
                                        Icons.camera_alt,
                                        color: Colors.grey[800],
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: controltitulo,
                        decoration: InputDecoration(labelText: "Titulo"),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: controldetalle,
                        decoration: InputDecoration(labelText: "Descripcion"),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: ElevatedButton(
                          child: Text("Nuevo Estado"),
                          onPressed: () {
                            var estados = <String, dynamic>{
                              'titulo': controltitulo.text,
                              'detalle': controldetalle.text,
                              'photo': controluser.photo,
                              'name': controluser.emailf,
                              'uid': controluser.uidf,
                              'fotoestado': ''
                            };

                            controlestados.crearestado(estados, _image);
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurpleAccent[700]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Seleccionar la camara o la galeria
  void _opcioncamara(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Imagen de Galeria'),
                      onTap: () {
                        _galeria();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Capturar Imagen'),
                    onTap: () {
                      _camara();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
