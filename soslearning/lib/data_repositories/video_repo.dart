import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:soslearning/models/video_model.dart';

class VideoRepository {
  Future<List<VideoModel>> getVideo() async {
    var url = "http://10.0.2.2:8000/new_app/video/";
    var vid_respose = await get(Uri.parse(url));

    if (vid_respose.statusCode == 200) {
      var decoded = jsonDecode(vid_respose.body) as List;
      var vid_list = decoded.map((e) => VideoModel.fromJson(e)).toList();
      debugPrint("$vid_list");
      return vid_list;
    }
    throw 'something went wrong';
  }
}
