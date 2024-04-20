import 'dart:convert';
import '../../../../config/config.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

/* Modelo de las taks que servira en un futuro tanto para obtenerlo desde la API como
  para usarlo en los widgets */
class TaskModel {
  int? id;
  String title;
  bool isComplete;
  String? dueDate;
  String? comments;
  String? description;
  String? tags;

  TaskModel({
    this.id,
    required this.title,
    this.isComplete = false,
    this.dueDate,
    this.comments,
    this.description,
    this.tags,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token':TOKEN,
      'title': title,
      'is_completed': isComplete == true?1:0,
      'due_date': dueDate,
      'comments': comments,
      'description': description,
      'tags': tags,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'] as int,
      title: map['title'] as String,
      isComplete: map['is_completed'] == 1 ? true : false,
      dueDate: map['due_date'] != null ? map['due_date'] as String: null,
      comments: map['comments'] != null ? map['comments'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      tags: map['tags'] != null ? map['tags'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, isCompleted: $isComplete, dueDate: $dueDate, comments: $comments, description: $description, tags: $tags)';
  }

  TaskModel copyWith({
    int? id,
    String? title,
    bool? isComplete,
    String? dueDate,
    String? comments,
    String? description,
    String? tags,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isComplete: isComplete ?? this.isComplete,
      dueDate: dueDate ?? this.dueDate,
      comments: comments ?? this.comments,
      description: description ?? this.description,
      tags: tags ?? this.tags,
    );
  }
}
