import 'package:steam_pal/domain/models/json/steam/player_count.dart';
import 'package:steam_pal/domain/models/json/steam/owned_games.dart';
import 'package:http/http.dart' as http;
import 'package:steam_pal/domain/models/json/steam/player_summary.dart';
import 'dart:convert';

import '../models/json/steam/global_achievements.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../utils/http_cache.dart';

class SteamAPI {
  static const _baseURL = 'https://api.steampowered.com';
  static final _steamKey = dotenv.env['STEAM_KEY'];

  static Future<SteamPlayerSummaryResponse> getPlayerSummary(int steamID) async {
    final response = await http.get(Uri.parse(
        '$_baseURL/ISteamUser/GetPlayerSummaries/v2/?key=$_steamKey&steamids=$steamID'));

    if (response.statusCode == 200) {
      return SteamPlayerSummaryResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get PLAYER_SUMMARY (STEAMID: $steamID)');
    }
  }

  static Future<SteamPlayerCountResponse> getPlayerCount(int gameID) async {
    final response = await http.get(Uri.parse(
        "$_baseURL/ISteamUserStats/GetNumberOfCurrentPlayers/v1/?appid=$gameID"));

    if (response.statusCode == 200) {
      return SteamPlayerCountResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get CURRENT_PLAYERS (GAMEID: $gameID)');
    }
  }

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
      throw Exception('Failed to get GLOBAL_ACHIEVEMENTS (GAMEID: $gameID');
    }
  }

  // Return a list of games owned by the player
  static Future<SteamOwnedGamesResponse> getOwnedGames(String steamID) async {
    const includeAppInfo = true; // Includes name and icon of game
    const includeFreeGames = true; // Includes free games

    final response = await HttpProvider.getData(
        Uri.parse('$_baseURL/IPlayerService/GetOwnedGames/v1/'
                '?key=$_steamKey'
                '&steamid=$steamID'
                '&include_appinfo=$includeAppInfo'
                '&include_played_free_games=$includeFreeGames'
                '&appids_filter' // Leave blank
                )
            .toString(),
        {});

    if (response.statusCode == 200) {
      return SteamOwnedGamesResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get USER_OWNED_GAMES');
    }
  }
}
