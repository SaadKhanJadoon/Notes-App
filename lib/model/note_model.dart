class Note {
  int? id;
  String? title;
  String? content;
  String? dateTimeEdited;
  String? dateTimeCreated;

  Note(
      {this.id,
      this.title,
      this.content,
      this.dateTimeEdited,
      this.dateTimeCreated});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "dateTimeEdited": dateTimeEdited,
      "dateTimeCreated": dateTimeCreated,
    };
  }
}
