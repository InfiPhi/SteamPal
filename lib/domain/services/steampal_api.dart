import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:steam_pal/domain/models/json/steampal/games.dart';

import 'igdb_api.dart';

class SteamPalAPI {
  static const _baseURL = '';

  static Future<SteamPalGameResponse> getAllUserGames() async {
    var steamID = -1;

    final response = await http.get(Uri.parse("$_baseURL/games/$steamID"));

    if (response.statusCode == 200) {
      return SteamPalGameResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get GAMEVAULT_GAMES');
    }
  }

  static Future<int> getSteamGameID(String gameTitle) async {
    final response =
        await http.get(Uri.parse("$_baseURL/games/steam/$gameTitle"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get GAMEVAULT_STEAM_ID');
    }
  }

  static Future<bool> addGame(String gameTitle) async {
    var steamID = -1;

    // Get Game details from IGDB
    var details = await IGDBAPI.getGameDetails(gameTitle);
    // Game doesn't exist inside IGDB
    if (details.potentialGames.isEmpty) return false;

    // IGDB returns a list of potential matches
    // Assume first match is the most accurate
    var game = details.potentialGames.first;

    // Group API calls
    final results = await Future.wait([
      SteamPalAPI.getSteamGameID(game.name), // Steam ID
      IGDBAPI.getGameCover(game.coverID), // Game Cover URL
      IGDBAPI.getGameGenres(game.genres), // Game Genres
      IGDBAPI.getGamePlatforms(game.platforms), // Game Platforms
      IGDBAPI.getGameCompanies(game.companies), // Game Companies
    ]);

    // Game to be added to the users database
    SteamPalGame toSend = SteamPalGame(
        gameTitle,
        results[0] as int,
        game.id,
        results[1] as String,
        results[2] as List<String>,
        results[3] as List<String>,
        results[4] as List<String>,
        game.releaseDate);

    final response = await http.post(Uri.parse("$_baseURL/add/$steamID"),
        body: toSend.toJson());

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to add GAMEVAULT_GAME');
    }
  }
}
