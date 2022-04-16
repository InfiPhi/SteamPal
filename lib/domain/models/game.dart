import 'package:intl/intl.dart';
import 'package:steam_pal/domain/services/igdb_api.dart';

class Game {
  String name;
  int? steamID;
  int? igdbID;
  String? coverURL;
  List<String> genres = [];
  List<String> platforms = [];
  List<String> companies = [];
  DateTime? releaseDate;

  Game(this.name);

  Future<void> load() async {
    var details = await IGDBAPI.getGameDetails(name);

    if (details.potentialGames.isEmpty) return;

    var game = details.potentialGames.first;

    // Group API calls
    final results = await Future.wait([
      IGDBAPI.getGameCover(game.coverID), // Game Cover URL
      IGDBAPI.getGameGenres(game.genres), // Game Genres
      IGDBAPI.getGamePlatforms(game.platforms), // Game Platforms
      IGDBAPI.getGameCompanies(game.companies), // Game Companies
    ]);

    // Steam Game's ID
    // TO-DO: Make API that returns gameID when passed game name

    igdbID = game.id;
    coverURL = results[0] as String;
    genres = results[1] as List<String>;
    platforms = results[2] as List<String>;
    companies = results[3] as List<String>;

    // Date game was released
    releaseDate = DateTime.fromMicrosecondsSinceEpoch(game.releaseDate * 1000000, isUtc: true);
  }

  String dateToString() {
    return releaseDate != null ? DateFormat.yMMMd().format(releaseDate!) : "Unknown";
  }

  bool isSteamGame() {
    return steamID != null;
  }

  @override
  String toString() {
    return "Name: $name\n"
        "Steam ID: $steamID\n"
        "IGDB ID: $igdbID\n"
        "Cover URL: $coverURL\n"
        "Genre(s): $genres\n"
        "Platform(s): $platforms\n"
        "Companie(s): $companies\n"
        "Release Date: ${dateToString()}";
  }
}
