import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/bloc/task/task_bloc.dart';
import 'package:flutter_shopping_cart/data/repositories/task/task_repository_impl.dart';

class TaskProvider extends StatelessWidget {
  const TaskProvider({super.key, required this.child, required this.taskRepositoryImpl});

  final Widget child;
  final TaskRepositoryImpl taskRepositoryImpl;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskBloc>(
        create: (BuildContext context) => TaskBloc(taskRepositoryImpl: taskRepositoryImpl),
        child: child,
    );
  }
}