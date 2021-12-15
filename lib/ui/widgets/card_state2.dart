import 'package:flutter/material.dart';

class CardState2 extends StatelessWidget {
  String titulo2;
  String pathImagen2;
  String estado2;

  CardState2({
    required this.titulo2,
    required this.pathImagen2,
    required this.estado2,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(titulo2),
      trailing: Image.asset(pathImagen2),
      subtitle: Text(estado2),
    );
  }
}
