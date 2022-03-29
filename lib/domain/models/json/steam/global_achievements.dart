/* SAMPLE RESPONSE */
// {
//   "achievementpercentages": {
//     "achievements": [
//       {
//       "name": "KillEliteMonster",
//       "percent": 77.0999984741210938
//       }
//   }
// }

class SteamGlobalAchievementsResponse {
  final SteamGlobalAchievements achievementPercentages;

  SteamGlobalAchievementsResponse(this.achievementPercentages);

  SteamGlobalAchievementsResponse.fromJson(Map<String, dynamic> json)
      : achievementPercentages = SteamGlobalAchievements.fromJson(json['achievementpercentages']);

  Map<String, dynamic> toJson() =>
      {'achievementpercentages': achievementPercentages.toJson()};
}

class SteamGlobalAchievements {
  final List<SteamGlobalAchievement> achievements;

  SteamGlobalAchievements(this.achievements);

  SteamGlobalAchievements.fromJson(Map<String, dynamic> json)
      : achievements = List<SteamGlobalAchievement>.from(
      json['achievements'].map((i) => SteamGlobalAchievement.fromJson(i)));

  Map<String, dynamic> toJson() => {
    'achievements':
    achievements.map((achievement) => achievement.toJson())
  };
}

class SteamGlobalAchievement {
  final String name;
  final double percent;

  SteamGlobalAchievement(this.name, this.percent);

  SteamGlobalAchievement.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        percent = json['percent'].toDouble();

  Map<String, dynamic> toJson() => {'name': name, 'percent': percent};
}