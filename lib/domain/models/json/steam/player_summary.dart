/* SAMPLE RESPONSE */
// {
//   "response": {
//     "players": [
//       {
//       "steamid": "76561198104497578",
//       "communityvisibilitystate": 3,
//       "profilestate": 1,
//       "personaname": "Sotoro",
//       "profileurl": "https://steamcommunity.com/profiles/76561198104497578/",
//       "avatar": "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/fb/fb5c2df645ca7831eae9440429f7b9e90d7a1adb.jpg",
//       "avatarmedium": "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/fb/fb5c2df645ca7831eae9440429f7b9e90d7a1adb_medium.jpg",
//       "avatarfull": "https://steamcdn-a.akamaihd.net/steamcommunity/public/images/avatars/fb/fb5c2df645ca7831eae9440429f7b9e90d7a1adb_full.jpg",
//       "avatarhash": "fb5c2df645ca7831eae9440429f7b9e90d7a1adb",
//       "lastlogoff": 1650039252,
//       "personastate": 1,
//       "realname": "Shae",
//       "primaryclanid": "103582791429521408",
//       "timecreated": 1377468493,
//       "personastateflags": 0,
//       "loccountrycode": "CA"
//       }
//     ]
//   }
// }

class SteamPlayerSummaryResponse {
  final SteamPlayerSummaries response;

  SteamPlayerSummaryResponse(this.response);

  SteamPlayerSummaryResponse.fromJson(Map<String, dynamic> json)
      : response = SteamPlayerSummaries.fromJson(json["response"]);

  Map<String, dynamic> toJson() =>
      {'response': response.toJson()};
}

class SteamPlayerSummaries {
  final List<SteamPlayerSummary> players;

  SteamPlayerSummaries(this.players);

  SteamPlayerSummaries.fromJson(Map<String, dynamic> json)
      : players = List<SteamPlayerSummary>.from(json["players"].map((player) => SteamPlayerSummary.fromJson(player)));

  Map<String, dynamic> toJson() =>
      {'response': players.map((player) => player.toJson())};
}

class SteamPlayerSummary {
  final int steamID;
  final String name;
  final String avatarFull;
  final String? countryCode;

  SteamPlayerSummary(this.steamID, this.name, this.avatarFull, this.countryCode);

  SteamPlayerSummary.fromJson(Map<String, dynamic> json)
      : steamID = int.parse(json['steamid']),
        name = json['personaname'],
        avatarFull = json['avatarfull'],
        countryCode = json['loccountrycode'];

  Map<String, dynamic> toJson() => {
    'steamid': steamID,
    'personaname': name,
    'avatarfull': avatarFull,
    'loccountrycode': countryCode,
  };
}