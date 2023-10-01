import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/bloc/task/task_bloc.dart';
import 'package:flutter_shopping_cart/bloc/task/task_state.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  static String routeName = '/task';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Task'),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              return switch (state) {
                TaskLoading() => const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                TaskLoadData() => SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Text(state.tasks[index].title),
                      childCount: state.tasks.length,
                    ),
                  ),
              };
            },
          )
        ],
      ),
    );
  }
}
