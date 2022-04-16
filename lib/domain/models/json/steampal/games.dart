/* SAMPLE RESPONSE */
// [
//   {
//     "name": "Risk of Rain 2",
//     "steam_id": 632360,
//     "igdb_id": 28512,
//     "image_url": "https://images.igdb.com/igdb/image/upload/t_cover_big_2x/co2eu7.jpg",
//     "genres" : ["Shooter", "Adventure", "Indie"],
//     "platforms" : ["PC", "Switch", "PS4", "Stadia", "XONE"],
//     "companies" : ["Hopoo Games", "Gearbox Publishing"],
//     "release_date" : 1553731200
//   }
// ]

class SteamPalGameResponse {
  final List<SteamPalGame> games;

  SteamPalGameResponse(this.games);

  SteamPalGameResponse.fromJson(List<dynamic> json)
      : games = List<SteamPalGame>.from(json.map((game) => SteamPalGame.fromJson(game)));

  Iterable<Map<String, dynamic>> toJson() => games.map((game) => game.toJson());
}

class SteamPalGame {
  final String name;
  final int? steamID;
  final int igdbID;
  final String imageURL;
  final List<String> genres;
  final List<String> platforms;
  final List<String> companies;
  final int releaseDate;

  SteamPalGame(this.name, this.steamID, this.igdbID, this.imageURL, this.genres,
      this.platforms, this.companies, this.releaseDate);

  SteamPalGame.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        steamID = json['steam_id'],
        igdbID = json['igdb_id'],
        imageURL = json['image_url'],
        genres = List<String>.from(json['genres']),
        platforms = List<String>.from(json['platforms']),
        companies = List<String>.from(json['companies']),
        releaseDate = json['release_date'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'steam_id': steamID,
        'igdb_id': igdbID,
        'image_url': imageURL,
        'genres': genres,
        'platforms': platforms,
        'companies': companies,
        'release_date': releaseDate
      };
}