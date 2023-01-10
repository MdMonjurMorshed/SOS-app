import 'dart:convert';

import 'package:http/http.dart';
import 'package:soslearning/models/course_model.dart';

class CourseRipo {
  Future<List<CourseModel>> getPost() async {
    String uri = "http://10.0.2.2:8000/new_app/articles/";
    var response = await get(Uri.parse(uri));

    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body) as List;

      final list = decode.map((val) => CourseModel.fromJson(val)).toList();
      print(list);
      return list;
    } else {
      throw "something went wrong";
    }
  }
}
