import 'dart:convert';

import 'package:http/http.dart';
import 'package:soslearning/models/video_model.dart';

class ApiRepo {
  List<VideoModel>? vidFile;

  Future vidApi(String url) async {
    print("got url:$url");
    var _url = Uri.parse(url);
    Response response = await get(_url);

    var decode = jsonDecode(response.body) as List;
    var makeList = decode.map((e) => VideoModel.fromJson(e)).toList();
    vidFile = makeList;
  }
}
