import 'package:steam_pal/domain/models/json/steam/owned_games.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/json/steam/global_achievements.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SteamAPI {
  static const _baseURL = 'https://api.steampowered.com/';
  static final _steamKey = dotenv.env['STEAM_KEY'];

  // Retrieves the global achievement percentages for the specified app
  static Future<SteamGlobalAchievementsResponse> getGlobalAchievements(
      int gameID) async {
    final response = await http.get(Uri.parse(
        '$_baseURL/ISteamUserStats/GetGlobalAchievementPercentagesForApp/v2/'
        '?gameid=$gameID'));

    if (response.statusCode == 200) {
      return SteamGlobalAchievementsResponse.fromJson(
          jsonDecode(response.body));
    } else {
      throw Exception('Failed to get GLOBAL_ACHIEVEMENTS');
    }
  }

  // Return a list of games owned by the player
  static Future<SteamOwnedGamesResponse> getOwnedGames(String steamID) async {
    const includeAppInfo = true; // Includes name and icon of game
    const includeFreeGames = true; // Includes free games

    final response =
        await http.get(Uri.parse('$_baseURL/IPlayerService/GetOwnedGames/v1/'
            '?key=$_steamKey'
            '&steamid=$steamID'
            '&include_appinfo=$includeAppInfo'
            '&include_played_free_games=$includeFreeGames'
            '&appids_filter' // Leave blank
            ));

    if (response.statusCode == 200) {
      return SteamOwnedGamesResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get USER_OWNED_GAMES');
    }
  }
}
