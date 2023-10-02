import 'package:auto_plus/simple_bloc_observer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'data/repositories/product_repository.dart';
import 'data/repositories/shopping_repository.dart';
import 'data/repositories/task/task_datasource.dart';
import 'data/repositories/task/task_repository_impl.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(
    shoppingRepository: ShoppingRepository(),
    productRepository: ProductRepository(),
    taskRepositoryImpl: TaskRepositoryImpl(TaskDatasource()),
  ));
}
