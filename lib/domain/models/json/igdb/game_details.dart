/* SAMPLE RESPONSE */
// [
//   {
//     "id": 114684,
//     "cover": 156533,
//     "first_release_date": 1558483200,
//     "genres": [
//       5
//     ],
//     "involved_companies": [
//       81013
//     ],
//     "name": "Splitgate",
//     "platforms": [
//       6,
//       48,
//       49,
//       167,
//       169
//     ]
//   }
// ]

class IGDBGameDetailsResponse {
  final List<IGDBGameDetails> potentialGames;

  IGDBGameDetailsResponse(this.potentialGames);

  IGDBGameDetailsResponse.fromJson(List<dynamic> json)
      : potentialGames = List<IGDBGameDetails>.from(json.map((game) => IGDBGameDetails.fromJson(game)));

  Iterable<Map<String, dynamic>> toJson() => potentialGames.map((game) => game.toJson());
}

class IGDBGameDetails {
  final int id;
  final String name;
  final int coverID;
  final int releaseDate;
  final List<int> genres;
  final List<int> companies;
  final List<int> platforms;

  IGDBGameDetails(this.id, this.name, this.coverID, this.releaseDate,
      this.genres, this.companies, this.platforms);

  IGDBGameDetails.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        coverID = json['cover'],
        releaseDate = json['first_release_date'],
        genres = json['genres'] != null ? List<int>.from(json['genres']) : [],
        companies = json['involved_companies'] != null ? List<int>.from(json['involved_companies']) : [],
        platforms = json['platforms'] != null ? List<int>.from(json['platforms']) : [];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'cover': coverID,
        'first_release_date': releaseDate,
        'genres': genres,
        'involved_companies': companies,
        'platforms': platforms,
      };
}
