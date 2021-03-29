class Blog {
  String id, createdAt, title, imageUrl;
//  int time;
  Blog({this.id, this.createdAt, this.title, this.imageUrl});

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
        id: json['id'],
        createdAt: json['createdAt'],
        title: json['title'],
        imageUrl: json['imageUrl']);
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "crecreatedAta": createdAt,
      "title": title,
      "imageUrl": imageUrl,
    };
  }
}
