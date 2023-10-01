import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/data/repositories/task/task_datasource.dart';
import 'package:flutter_shopping_cart/data/repositories/task/task_repository_impl.dart';
import 'package:flutter_shopping_cart/data/model/task.dart';
import 'package:flutter_shopping_cart/screen/task/page/task_page.dart';
import 'package:flutter_shopping_cart/widgets/common_text_field.dart';
import 'package:gap/gap.dart';


class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({super.key});

  static String routeName = '/createTask';

  @override
  State<CreateTaskPage> createState() => CreateTaskScreen();
}

class CreateTaskScreen extends State<CreateTaskPage> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TaskRepositoryImpl taskRepositoryImpl = TaskRepositoryImpl(TaskDatasource());

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Task'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                hintText: 'Title',
                title: 'Title',
                controller: _titleController,
              ),
              const Gap(30),
              CommonTextField(
                hintText: 'Note',
                title: 'Address',
                controller: _noteController,
              ),
              const Gap(30),
              ElevatedButton(
                onPressed: () => _createTask(context),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text('Save'),
                  ),
                ),
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createTask(BuildContext context) async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    if (title.isNotEmpty) {
      final task = Task(
        title: title,
        note: note,
        isCompleted: false,
      );

      await taskRepositoryImpl.add(task).then((value) =>
      {
        Navigator.pushNamed(context, TaskPage.routeName)
      },);
    } else {
      // AppAlerts.displaySnackbar(context, 'Title cannot be empty');
    }
  }

}