import 'dart:convert';
import 'package:Matrix_Game2/data/models/juego.dart';
import 'package:http/http.dart' as http;

class GameService {
  final String url = 'https://www.freetogame.com';

  Future<List<Juego>> getJuegos() async {
    var uri = Uri.https(url, '/api/games');
    final respuesta = await http.get(uri);

    if (respuesta.statusCode == 200) {
      var res = json.decode(respuesta.body);
      final List<Juego> juegos = [];
      for (var item in res) {
        juegos.add(Juego.fromJson(item));
      }
      print('Hola');
      return juegos;
    } else {
      throw Exception('Error');
    }
  }
}
