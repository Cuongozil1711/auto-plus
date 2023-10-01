import 'package:bloc/bloc.dart';

import 'counter_event.dart';


class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    // emit phát ra event
    on<IncreaseEvent>((event, emit) => _increase(emit));
    on<DecreaseEvent>((event, emit) => _decrease(emit));
  }

  void _increase(Emitter emit) {
    emit(state + 1);
  }

  void _decrease(Emitter emit) {
    emit(state - 1);
  }
}
