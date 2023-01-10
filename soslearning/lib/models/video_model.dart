class VideoModel {
  int? id;

  String title;
  String url;

  VideoModel({this.id, required this.title, required this.url});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(id: json["id"], title: json["title"], url: json["url"]);
  }
}
