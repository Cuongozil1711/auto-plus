import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/bloc/cart/cart_bloc.dart';
import 'package:flutter_shopping_cart/bloc/catalog/catalog_bloc.dart';
import 'package:flutter_shopping_cart/bloc/product/product_bloc.dart';
import 'package:flutter_shopping_cart/bloc/task/task_bloc.dart';
import 'package:flutter_shopping_cart/bloc/task/task_event.dart';
import 'package:flutter_shopping_cart/data/repositories/product_repository.dart';
import 'package:flutter_shopping_cart/data/repositories/shopping_repository.dart';
import 'package:flutter_shopping_cart/data/repositories/task/task_repository_impl.dart';
import 'package:flutter_shopping_cart/screen/cart/view/cart_page.dart';
import 'package:flutter_shopping_cart/screen/catalog/view/catalog_page.dart';
import 'package:flutter_shopping_cart/screen/counter/counter_page.dart';
import 'package:flutter_shopping_cart/screen/product/view/product_page.dart';
import 'package:flutter_shopping_cart/screen/sign_in/sign_in_screen.dart';
import 'package:flutter_shopping_cart/screen/splash/splash_screen.dart';
import 'package:flutter_shopping_cart/screen/task/page/create_task_page.dart';
import 'package:flutter_shopping_cart/screen/task/page/task_page.dart';

class App extends StatelessWidget {
  const App(
      {required this.shoppingRepository,
      required this.productRepository,
      required this.taskRepositoryImpl,
      super.key});

  final ShoppingRepository shoppingRepository;
  final ProductRepository productRepository;
  final TaskRepositoryImpl taskRepositoryImpl;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProductBloc(productRepository: productRepository)
            ..add(ProductStarted()),
        ),
        BlocProvider(
          create: (_) => CatalogBloc(
            shoppingRepository: shoppingRepository,
          )..add(CatalogStarted()),
        ),
        BlocProvider(
          create: (_) => CartBloc(
            shoppingRepository: shoppingRepository,
          )..add(CartStarted()),
        ),
        BlocProvider(
          create: (_) => TaskBloc(
            taskRepositoryImpl: taskRepositoryImpl,
          )..add(GetAllTask()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Bloc Shopping Cart',
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          SignInScreen.routeName: (context) => const SignInScreen(),
          CatalogPage.routeName: (context) => const CatalogPage(),
          CartPage.routeName: (context) => const CartPage(),
          ProductPage.routeName: (context) => const ProductPage(),
          CounterPage.routeName: (context) => const CounterPage(),
          TaskPage.routeName: (context) => const TaskPage(),
          CreateTaskPage.routeName: (context) => const CreateTaskPage(),
        },
      ),
    );
  }
}
