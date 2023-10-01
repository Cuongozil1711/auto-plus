import 'package:equatable/equatable.dart';
import 'package:flutter_shopping_cart/data/model/task.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class TaskLoading extends TaskState {}
//
// final class TaskCreate extends TaskState {
//   final Task task;
//
//   const TaskCreate({required this.task});
//
//   @override
//   List<Object> get props => [task];
// }

final class TaskLoadData extends TaskState {
  final List<Task> tasks;

  const TaskLoadData({required this.tasks});

  @override
  List<Object> get props => [tasks];
}



