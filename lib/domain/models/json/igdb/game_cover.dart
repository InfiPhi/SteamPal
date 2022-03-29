/* SAMPLE RESPONSE */
// [
//   {
//     "id": 112543,
//     "game": 28512,
//     "image_id": "co2eu7"
//   }
// ]

class IGDBGameCoverResponse {
  final List<IGDBGameCover> potentialCovers;

  IGDBGameCoverResponse(this.potentialCovers);

  IGDBGameCoverResponse.fromJson(List<dynamic> json)
      : potentialCovers = List<IGDBGameCover>.from(json.map((cover) => IGDBGameCover.fromJson(cover)));

  Iterable<Map<String, dynamic>> toJson() => potentialCovers.map((cover) => cover.toJson());
}

class IGDBGameCover {
  final int id;
  final int gameID;
  final String imageID;

  IGDBGameCover(this.id, this.gameID, this.imageID);

  IGDBGameCover.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        gameID = json['game'],
        imageID = json['image_id'];

  Map<String, dynamic> toJson() => {'id': id, 'game': gameID, 'image_id': imageID};
}