import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/app.dart';
import 'package:flutter_shopping_cart/data/repositories/product_repository.dart';
import 'package:flutter_shopping_cart/data/repositories/shopping_repository.dart';
import 'package:flutter_shopping_cart/data/repositories/task/task_datasource.dart';
import 'package:flutter_shopping_cart/data/repositories/task/task_repository_impl.dart';
import 'package:flutter_shopping_cart/simple_bloc_observer.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(
    shoppingRepository: ShoppingRepository(),
    productRepository: ProductRepository(),
    taskRepositoryImpl: TaskRepositoryImpl(TaskDatasource()),
  ));
}
