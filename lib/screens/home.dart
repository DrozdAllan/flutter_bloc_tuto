import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tuto/cubit/counter_cubit.dart';
import 'package:flutter_bloc_tuto/cubit/happy_cubit.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('zinzin'),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncremented!) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Incremented!'),
                duration: Duration(milliseconds: 300),
              ),
            );
          } else if (state.wasIncremented! == false) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Decremented!'),
                duration: Duration(milliseconds: 300),
              ),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                    state.counterValue.toString(),
                    style: const TextStyle(fontSize: 36.0),
                  );
                },
              ),
              BlocBuilder<HappyCubit, bool>(
                builder: (context, state) {
                  return Text(state.toString());
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                      BlocProvider.of<HappyCubit>(context).sad();
                    },
                    tooltip: 'DECREMENT',
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                        BlocProvider.of<HappyCubit>(context).happy();
                      },
                      tooltip: 'INCREMENT',
                      child: const Icon(Icons.add)),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
