class Note {
  int? id;
  String title;
  String content;
  String author;
  String? createdAt;
  String? updatedAt;

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.author,
    this.createdAt,
    this.updatedAt,
  });
  // convert object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'author': author,
      'created_At': createdAt,
      'updated_At': updatedAt,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      author: map['author'],
      createdAt: map['created_At'],
      updatedAt: map['updated_At'],
    );
  }
}
