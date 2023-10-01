import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class CounterProvider extends StatelessWidget {

  const CounterProvider({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
        create: (BuildContext context) => CounterBloc(),
        child: child,
    );
  }
}
