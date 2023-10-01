import 'package:bloc/bloc.dart';
import 'package:flutter_shopping_cart/bloc/task/task_event.dart';
import 'package:flutter_shopping_cart/bloc/task/task_state.dart';
import 'package:flutter_shopping_cart/data/repositories/task/task_repository_impl.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc({required this.taskRepositoryImpl}) : super(TaskLoading()) {
    on<CreateTask>(createTask);
    on<GetAllTask>(getAllTask);
  }

  final TaskRepositoryImpl taskRepositoryImpl;

  void createTask(CreateTask event, Emitter<TaskState> emit) {}

  Future<void> getAllTask(GetAllTask event, Emitter<TaskState> emit) async {
    try {
      emit(TaskLoading());
      final tasks = await taskRepositoryImpl.getAll();
      emit(TaskLoadData(tasks: tasks));
    } catch (_) {
      print('Error TaskBloc');
    }
  }
}
