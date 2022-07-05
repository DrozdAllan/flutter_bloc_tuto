import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_tuto/logic/cubits/counter/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit? counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit!.close();
    });

    test(
        'the initial state for the CounterCubit is CounterState(counterValue:0)',
        () {
      expect(counterCubit!.state, CounterState(counterValue: 0));
    });

    blocTest<CounterCubit, CounterState>(
      'emits CounterState(counterValue: 1, wasIncremented: true) when cubit.increment() is called.',
      build: () => CounterCubit(),
      act: (cubit) => cubit.increment(),
      expect: () =>
          <CounterState>[CounterState(counterValue: 1, wasIncremented: true)],
    );
  });
}
