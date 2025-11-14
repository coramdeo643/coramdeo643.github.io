class PostModel {
  int id;
  String title;
  String content;
  String menuId;
  bool isPublished;
  DateTime createdAt;
  DateTime updatedAt;

  PostModel({
    required this.id,
    required this.title,
    required this.content,
    required this.menuId,
    required this.isPublished,
    required this.createdAt,
    required this.updatedAt,
  });
}
