class StateModel2 {
  String titulo2;
  String pathImagen2;
  String estado2;

  StateModel2({
    required this.titulo2,
    required this.pathImagen2,
    required this.estado2,
  });

  factory StateModel2.fromJson(Map<String, dynamic> map) {
    return StateModel2(
      titulo2: map['titulo2'],
      pathImagen2: map['pathImagen2'],
      estado2: map['estado2'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'titulo2': titulo2,
      'pathImagen2': pathImagen2,
      'estado2': estado2,
    };
  }
}
