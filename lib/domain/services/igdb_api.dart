import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:steam_pal/domain/models/json/igdb/game_cover.dart';
import 'package:steam_pal/domain/models/json/igdb/game_details.dart';
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
  static final _headers = {
    'Client-ID': '$_clientID',
    HttpHeaders.authorizationHeader: 'Bearer $_accessToken',
    HttpHeaders.acceptHeader: 'application/json'
  };

  static Future<IGDBGameDetailsResponse> getGameDetails(String gameName) async {
    var uri = Uri.parse('$_baseURL/games').replace(queryParameters: {
      'fields':
          'id, name, cover, first_release_date, involved_companies, genres, platforms; where name ~ "$gameName";'
    });

    final response = await HttpProvider.getData(uri.toString(), _headers);

    if (response.statusCode == 200) {
      return IGDBGameDetailsResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get IGDB_GAME_ID');
    }
  }

  static Future<List<String>> getGameGenres(List<int> genreIDs) async {
    if (genreIDs.isEmpty) return [];

    var uri = Uri.parse('$_baseURL/genres').replace(queryParameters: {
      'fields': 'name; where id = (${genreIDs.join(",")});'
    });

    final response = await HttpProvider.getData(uri.toString(), _headers);

    if (response.statusCode == 200) {
      return List<String>.from(jsonDecode(response.body).map((obj) => obj['name']).toList());
    } else {
      throw Exception('Failed to get IGDB_GENRES');
    }
  }

  static Future<List<String>> getGamePlatforms(List<int> platformIDs) async {
    if (platformIDs.isEmpty) return [];

    var uri = Uri.parse('$_baseURL/platforms').replace(queryParameters: {
      'fields': 'abbreviation; where id = (${platformIDs.join(",")});'
    });

    final response = await HttpProvider.getData(uri.toString(), _headers);

    if (response.statusCode == 200) {
      return List<String>.from(jsonDecode(response.body).map((obj) => obj['abbreviation']).toList());
    } else {
      throw Exception('Failed to get IGDB_PLATFORMS');
    }
  }

  static Future<List<String>> getGameCompanies(List<int> involvedCompaniesIDs) async {
    if (involvedCompaniesIDs.isEmpty) return [];

    var uri = Uri.parse('$_baseURL/involved_companies').replace(queryParameters: {
      'fields': 'company; where id = (${involvedCompaniesIDs.join(",")});'
    });

    final involvedResponse = await HttpProvider.getData(uri.toString(), _headers);

    if (involvedResponse.statusCode == 200) {
      var companiesIDs = jsonDecode(involvedResponse.body).map((c) => c["company"]);

      uri = Uri.parse('$_baseURL/companies').replace(queryParameters: {
        'fields': 'name; where id = (${companiesIDs.join(",")});'
      });

      final companyResponse = await HttpProvider.getData(uri.toString(), _headers);

      return List<String>.from(jsonDecode(companyResponse.body).map((obj) => obj['name']).toList());
    } else {
      throw Exception('Failed to get IGDB_PLATFORMS');
    }
  }

  // Retrieves IGDBs gameIDs for each name provided (if it exist)
  static Future<String> getGameCover(int coverID) async {
    var uri = Uri.parse('$_baseURL/covers').replace(
        queryParameters: {'fields': 'id, image_id; where id = ($coverID)'});

    final response = await HttpProvider.getData(uri.toString(), _headers);

    // Step 4: Process cover data
    if (response.statusCode == 200) {
      var coverResponse =
          IGDBGameCoverResponse.fromJson(jsonDecode(response.body));
      var url = '';
      if (coverResponse.potentialCovers.isNotEmpty) {
        var imageFormat = 'cover_big_2x';
        var imageID = coverResponse.potentialCovers.first.imageID;
        url =
            'https://images.igdb.com/igdb/image/upload/t_$imageFormat/$imageID.jpg';
      }

      return url;
    } else {
      throw Exception('Failed to get IGDB_GAME_COVER');
    }
  }

  // Retrieves IGDBs gameIDs for each name provided (if it exist)
  static Future<List<GameInfo>> getGameCovers(List<String> gameNames) async {
    if (gameNames.isEmpty) return [];
    // Step 1: Get IGDB gameIDs
    return IGDBAPI.getGameIDs(gameNames).then((gameResponse) async {
      String gameIDQuery = "";
      Map<int, String> gameIdToName = {};

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

      final response = await HttpProvider.getData(uri.toString(), _headers);

      // Step 4: Process cover data
      if (response.statusCode == 200) {
        var coverResponse =
            IGDBGameCoverResponse.fromJson(jsonDecode(response.body));
        var imageFormat = 'cover_big_2x';
        List<GameInfo> result = [];

        // Step 4.1: Convert data into GameInfo struct (name, url)
        for (IGDBGameCover cover in coverResponse.potentialCovers) {
          String url =
              'https://images.igdb.com/igdb/image/upload/t_$imageFormat/${cover.imageID}.jpg';
          String name = gameIdToName[cover.gameID] ?? "Unknown";
          result.add(GameInfo(name, url));
        }

        // Sort alphabetically
        result.sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

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

    final response = await HttpProvider.getData(uri.toString(), _headers);

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
