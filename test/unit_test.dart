import 'package:bloc_provider/blocs/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test CounterBloc should work perfectly:', () {
    test('Counter start with value of zero', () {
      CounterBloc _counterBloc = CounterBloc();
      expect(_counterBloc.currentCounter, 0);
    });

    test('Get correct counter value after call increaseCounter', () {
      CounterBloc _counterBloc = CounterBloc();
      _counterBloc.increaseCounter();
      expect(_counterBloc.currentCounter, 1);
      _counterBloc.increaseCounter();
      expect(_counterBloc.currentCounter, 2);
      _counterBloc.increaseCounter();
      expect(_counterBloc.currentCounter, 3);
    });
  });
}
