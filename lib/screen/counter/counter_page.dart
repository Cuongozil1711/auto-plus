import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/bloc/counter/counter_bloc.dart';
import 'package:flutter_shopping_cart/bloc/counter/counter_event.dart';
import 'package:flutter_shopping_cart/bloc/counter/counter_provider.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  static String routeName = '/counter';

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final TextStyle textStyle = const TextStyle(fontSize: 30);
  @override
  Widget build(BuildContext context) {
    return CounterProvider(child: Scaffold(
      body: BlocBuilder<CounterBloc, int>(builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count $state', style: textStyle),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _customButton(() => _increase(context), 'Increase'),
                _customButton(() => _decrease(context), 'Decrease'),
              ],
            )
          ],
        );
      }),
    ));
  }

  void _increase(BuildContext context){
    context.read<CounterBloc>().add(IncreaseEvent());
  }

  void _decrease(BuildContext context){
    context.read<CounterBloc>().add(DecreaseEvent());
  }

  Widget _customButton(Function() onPressed, String text){
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}