class CourseModel {
  int? id;

  String title;
  String? description;

  CourseModel({this.id, required this.title, this.description});

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
        id: json["id"], title: json["title"], description: json["description"]);
  }
}
