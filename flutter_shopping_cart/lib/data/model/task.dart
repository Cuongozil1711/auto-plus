import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_cart/data/model/keys/task_keys.dart';


class Task extends Equatable {
  final int? id;
  final String title;
  final String note;
  final bool isCompleted;
  const Task({
    this.id,
    required this.title,
    required this.note,
    required this.isCompleted,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      TaskKeys.id: id,
      TaskKeys.title: title,
      TaskKeys.note: note,
      TaskKeys.isCompleted: isCompleted ? 1 : 0,
    };
  }

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
      id: map[TaskKeys.id] as int,
      title: map[TaskKeys.title] as String,
      note: map[TaskKeys.note] as String,
      isCompleted: map[TaskKeys.isCompleted] == 1 ? true : false,
    );
  }

  @override
  List<Object> get props {
    return [
      title,
      note,
      isCompleted,
    ];
  }

  Task copyWith({
    int? id,
    String? title,
    String? note,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
