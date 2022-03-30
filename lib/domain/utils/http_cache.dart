import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart';

class HttpProvider {
  static Future<Response> getData(
      String url, Map<String, String> headers) async {
    var file = await DefaultCacheManager().getSingleFile(url, headers: headers);
    if (await file.exists()) {
      var res = await file.readAsString();
      return Response(res, 200);
    }
    return Response("", 404);
  }

  static void clearCache() {
    DefaultCacheManager().emptyCache();
  }
}
