class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  // Convert JSON to Post
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  // Convert SQLite Map to Post
  // factory Post.fromMap(Map<String, dynamic> map) {
  //   return Post(
  //     id: map['id'],
  //     title: map['title'],
  //     body: map['body'],
  //   );
  // }

  // Convert Post to Map for SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
