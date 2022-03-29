/* SAMPLE RESPONSE */
// {
//   "response": {
//     "game_count": 74,
//     "games": [
//       {
//       "appid": 4000,
//       "name": "Garry's Mod",
//       "playtime_forever": 4093,
//       "img_icon_url": "4a6f25cfa2426445d0d9d6e233408de4d371ce8b",
//       "has_community_visible_stats": true,
//       "playtime_windows_forever": 0,
//       "playtime_mac_forever": 0,
//       "playtime_linux_forever": 0
//       }
//     ]
//   }
// }

class SteamOwnedGamesResponse {
  final SteamOwnedGames response;

  SteamOwnedGamesResponse(this.response);

  SteamOwnedGamesResponse.fromJson(Map<String, dynamic> json)
      : response = SteamOwnedGames.fromJson(json['response']);

  Map<String, dynamic> toJson() => {'response': response.toJson()};
}

class SteamOwnedGames {
  final int gameCount;
  final List<SteamGame> games;

  SteamOwnedGames(this.gameCount, this.games);

  SteamOwnedGames.fromJson(Map<String, dynamic> json)
      : gameCount = json['game_count'],
        games =
            List<SteamGame>.from(json['games'].map((game) => SteamGame.fromJson(game)));

  Map<String, dynamic> toJson() =>
      {'game_count': gameCount, 'games': games.map((game) => game.toJson())};
}

class SteamGame {
  final int appID;
  final String name;
  final int playtime;
  final String iconURL;

  SteamGame(
      this.appID, this.name, this.playtime, this.iconURL);

  SteamGame.fromJson(Map<String, dynamic> json)
      : appID = json['appid'],
        name = json['name'],
        playtime = json['playtime_forever'],
        iconURL = json['img_icon_url'];

  Map<String, dynamic> toJson() => {
        'appid': appID,
        'name': name,
        'playtime_forever': playtime,
        'img_icon_url': iconURL
      };
}
