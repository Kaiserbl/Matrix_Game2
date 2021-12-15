import 'package:flutter/material.dart';

class CardState extends StatelessWidget {
  String titulo;
  Widget pathImagen;
  String estado;

  CardState({
    required this.titulo,
    required this.pathImagen,
    required this.estado,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(titulo),
      trailing: pathImagen,
      subtitle: Text(estado),
    );
  }
}
