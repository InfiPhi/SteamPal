import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:steam_pal/domain/models/json/igdb/game_cover.dart';
import '../models/json/igdb/game_id.dart';
import '../utils/http_cache.dart';

class IGDBAPI {
  static const _baseURL = 'https://api.igdb.com/v4';
  static final _clientID = dotenv.env['IGDB_CLIENT_ID'];
  static final _accessToken = dotenv.env['IGDB_ACCESS_TOKEN'];

  // Retrieves IGDBs gameIDs for each name provided (if it exist)
  static Future<List<String>> getGameCovers(List<String> gameNames) async {
    return IGDBAPI.getGameIDs(gameNames).then((gameResponse) async {
      var gameIDs =
          gameResponse.potentialGames.map((gameID) => gameID.id).join(",");

      var uri = Uri.parse('$_baseURL/covers').replace(queryParameters: {
        'fields': 'game, image_id; where game = ($gameIDs)'
      });

      var headers = {
        'Client-ID': '$_clientID',
        HttpHeaders.authorizationHeader: 'Bearer $_accessToken',
        HttpHeaders.acceptHeader: 'application/json'
      };

      final coverResponse = await HttpProvider.getData(uri.toString(), headers);

      if (coverResponse.statusCode == 200) {
        var decodedResponse =
            IGDBGameCoverResponse.fromJson(jsonDecode(coverResponse.body));
        var imageFormat = 'cover_big_2x';

        return decodedResponse.potentialCovers
            .map((c) =>
                'https://images.igdb.com/igdb/image/upload/t_$imageFormat/${c.imageID}.jpg')
            .toList();
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
      'fields': 'id, name; where name = (${IGDBAPI._formatList(gameNames)})'
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
    // Output '"Risk of Rain 2","Overwatch"'
    return list.fold(
        "",
        (value, element) =>
            value + (value.isEmpty ? "" : ",") + "\"$element\"");
  }
}
