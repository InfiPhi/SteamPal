import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:steam_pal/domain/models/json/igdb/game_cover.dart';
import '../models/json/igdb/game_id.dart';
import '../utils/http_cache.dart';

class GameInfo {
  GameInfo(this.name, this.url);
  final String name;
  final String url;
}

class IGDBAPI {
  static const _baseURL = 'https://api.igdb.com/v4';
  static final _clientID = dotenv.env['IGDB_CLIENT_ID'];
  static final _accessToken = dotenv.env['IGDB_ACCESS_TOKEN'];

  // Retrieves IGDBs gameIDs for each name provided (if it exist)
  static Future<List<GameInfo>> getGameCovers(List<String> gameNames) async {
    if (gameNames.isEmpty) return [];
    // Step 1: Get IGDB gameIDs
    return IGDBAPI.getGameIDs(gameNames).then((gameResponse) async {
      String gameIDQuery = "";
      Map<int,String> gameIdToName = {};

      // Step 2 & 3:
      // Concatenate gameIDs to comma separated string
      // Create a map (gameID -> gameName)
      for (IGDBGameID game in gameResponse.potentialGames) {
        gameIDQuery += game.id.toString() + ',';
        gameIdToName[game.id] = game.name;
      }

      // Step 2.1: Remove trailing comma
      if (gameIDQuery.isNotEmpty) {
        gameIDQuery = gameIDQuery.substring(0, gameIDQuery.length - 1);
      }

      // Step 4: Get IGDB game cover imageID
      var uri = Uri.parse('$_baseURL/covers').replace(queryParameters: {
        'fields': 'game, image_id; limit 100; where game = ($gameIDQuery)'
      });

      var headers = {
        'Client-ID': '$_clientID',
        HttpHeaders.authorizationHeader: 'Bearer $_accessToken',
        HttpHeaders.acceptHeader: 'application/json'
      };

      final response = await HttpProvider.getData(uri.toString(), headers);

      // Step 4: Process cover data
      if (response.statusCode == 200) {
        var coverResponse =
            IGDBGameCoverResponse.fromJson(jsonDecode(response.body));
        var imageFormat = 'cover_big_2x';
        List<GameInfo> result = [];

        // Step 4.1: Convert data into GameInfo struct (name, url)
        for (IGDBGameCover cover in coverResponse.potentialCovers) {
          String url = 'https://images.igdb.com/igdb/image/upload/t_$imageFormat/${cover.imageID}.jpg';
          String name = gameIdToName[cover.gameID] ?? "Unknown";
          result.add(GameInfo(name, url));
        }

        // Sort alphabetically
        result.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

        return result;
      } else {
        throw Exception('Failed to get IGDB_GAME_COVER');
      }
    }).catchError((error) {
      throw Exception('Failed to get IGDB_GAME_ID');
    });
  }

  // Retrieves IGDBs gameIDs for each name provided (if it exist)
  static Future<IGDBGameIDResponse> getGameIDs(List<String> gameNames) async {
    var uri = Uri.parse('$_baseURL/games').replace(queryParameters: {
      'fields': 'id, name; limit 100; where ${IGDBAPI._formatList(gameNames)};'
    });

    var headers = {
      'Client-ID': '$_clientID',
      HttpHeaders.authorizationHeader: 'Bearer $_accessToken',
      HttpHeaders.acceptHeader: 'application/json'
    };

    final response = await HttpProvider.getData(uri.toString(), headers);

    if (response.statusCode == 200) {
      return IGDBGameIDResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get IGDB_GAME_ID');
    }
  }

  static String _formatList(List<String> list) {
    // Input: [Risk of Rain 2, Overwatch]
    // Output " name ~ 'Risk of Rain 2' | name ~ 'Overwatch' "
    return list.fold(
        "",
        (value, element) =>
            value + (value.isEmpty ? "" : " | ") + "name ~ \"$element\"");
  }
}
