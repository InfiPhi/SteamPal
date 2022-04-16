/* SAMPLE RESPONSE */
// {
//   "response": {
//     "player_count": 15559,
//     "result": 1
//   }
// }

class SteamPlayerCountResponse {
  final SteamPlayerCount response;

  SteamPlayerCountResponse(this.response);

  SteamPlayerCountResponse.fromJson(Map<String, dynamic> json)
      : response = SteamPlayerCount.fromJson(json['response']);

  Map<String, dynamic> toJson() =>
      {'response': response.toJson()};
}

class SteamPlayerCount {
  final int playerCount;
  final int result;

  SteamPlayerCount(this.playerCount, this.result);

  SteamPlayerCount.fromJson(Map<String, dynamic> json)
      : playerCount = json['player_count'],
        result = json['result'];

  Map<String, dynamic> toJson() =>
      {'player_count': playerCount, 'result': result};
}