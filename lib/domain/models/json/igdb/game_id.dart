/* SAMPLE RESPONSE */
// [
//   {
//     "id": 8173,
//     "name": "Overwatch"
//   }
// ]

class IGDBGameIDResponse {
  final List<IGDBGameID> potentialGames;

  IGDBGameIDResponse(this.potentialGames);

  IGDBGameIDResponse.fromJson(List<dynamic> json)
      : potentialGames = List<IGDBGameID>.from(json.map((game) => IGDBGameID.fromJson(game)));

  Map<String, dynamic> toJson() => {'response': potentialGames.map((game) => game.toJson())};
}

class IGDBGameID {
  final int id;
  final String name;

  IGDBGameID(this.id, this.name);

  IGDBGameID.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
