import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int counter = 0;
  CounterCubit() : super(CounterInitial());

  countericrement() {
    counter += 1;
    emit(CounterValueChange(counter: counter));
  }

  counterdecrement() {
    counter -= 1;
    emit(CounterValueChange(counter: counter));
  }

  counterreset() {
    counter = 0;
    emit(CounterValueChange(counter: counter));
  }
}
