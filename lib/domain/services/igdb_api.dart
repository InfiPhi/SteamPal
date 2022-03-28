import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/json/igdb/game_id.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class IGDBAPI {
  static const _baseURL = 'https://api.igdb.com/v4';
  static final  _clientID = dotenv.env['IGDB_CLIENT_ID'];
  static final _accessToken = dotenv.env['IGDB_ACCESS_TOKEN'];

  // Retrieves the global achievement percentages for the specified app
  static Future<IGDBGameIDResponse> getGameID(String gameName) async {
    var uri = Uri.parse('$_baseURL/games').replace(
        queryParameters: {'fields': 'id, name; where name = "$gameName"'});

    var headers = {
      'Client-ID': '$_clientID',
      HttpHeaders.authorizationHeader: 'Bearer $_accessToken',
      HttpHeaders.acceptHeader: 'application/json'
    };

    final response = await http.post(uri, headers: headers);

    if (response.statusCode == 200) {
      return IGDBGameIDResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get IGDB_GAME_ID');
    }
  }
}
