import 'dart:convert';
import 'package:Matrix_Game2/data/models/game_model.dart';
import 'package:Matrix_Game2/domain/services/misiontic_interface.dart';
import 'package:http/http.dart' as http;

class GamePoolService implements MisionTicService {
  final String baseUrl = 'www.freetogame.com';

  @override
  Future<List<GameModel>> fecthData({int limit = 10, Map? map}) async {
    var uri = Uri.https(baseUrl, '/api/games');
    final response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> res = json.decode(response.body);
      final List<GameModel> games = [];
      for (var game in res.take(limit)) {
        games.add(GameModel.fromJson(game));
      }
      return games;
    } else {
      throw Exception('Error on request');
    }
  }
}
