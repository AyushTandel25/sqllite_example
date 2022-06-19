const String notesTableName = "notes";

class NotesFields {
  static const String id = "_id";
  static const String title = "title";
  static const String description = "description";
  static const String time = "time";
  static const String isImportant = "isImportant";
}

class NotesData {
  final int? id;
  final String? title;
  final String? description;
  final String? createdTime;
  final bool? isImportant;

  NotesData({
    this.id,
    this.title,
    this.description,
    this.createdTime,
    this.isImportant,
  });

  NotesData? fromJson(Map<String, dynamic> json) {
    return NotesData(
      id: json['_id'],
      description: json['description'],
      createdTime: json['time'],
      title: json['title'],
      isImportant: json['isImportant'],
    );
  }

  Map<String,dynamic> toJson() => {
    NotesFields.id:id,
    NotesFields.description:description,
    NotesFields.title:title,
    NotesFields.isImportant:isImportant,
    NotesFields.time:createdTime,
  };
}
