import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  String title;
  bool isComplete;
  DateTime? dueDate;
  String? comments;
  String? description;
  String? tags;
  
  TaskModel({
    required this.title,
    required this.isComplete,
    this.dueDate,
    this.comments,
    this.description,
    this.tags,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'is_complete': isComplete,
      'due_date': dueDate?.millisecondsSinceEpoch,
      'comments': comments,
      'description': description,
      'tags': tags,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] as String,
      isComplete: map['is_complete'] == 1? true:false,
      dueDate: map['due_date'] != null ? DateTime.parse(map['due_date']) : null,
      comments: map['comments'] != null ? map['comments'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      tags: map['tags'] != null ? map['tags'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) => TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
