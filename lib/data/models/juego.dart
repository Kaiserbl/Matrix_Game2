class Juego {
  String title;
  String short_description;
  String genre;
  String freetogame_profile_url;

  Juego({
    required this.title,
    required this.short_description,
    required this.genre,
    required this.freetogame_profile_url,
  });

  factory Juego.fromJson(Map<String, dynamic> map) {
    return Juego(
        title: map['titulo'],
        short_description: map['short_description'],
        genre: map['genre'],
        freetogame_profile_url: map['freetogame_profile_url']);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'short_description': short_description,
      'genre': genre,
      'freetogame_profile_url': freetogame_profile_url,
    };
  }
}
