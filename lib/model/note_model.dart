class Note {
  int? id;
  String? title;
  String? content;
  String? dateTimeEdited;
  String? dateTimeCreated;
  bool? isFavorite;

  Note(
      {this.id,
      this.title,
      this.content,
      this.dateTimeEdited,
      this.dateTimeCreated,
      this.isFavorite});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "dateTimeEdited": dateTimeEdited,
      "dateTimeCreated": dateTimeCreated,
      "isFavorite": isFavorite
    };
  }
}
