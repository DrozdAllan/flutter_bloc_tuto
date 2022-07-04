import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tuto/cubit/counter_cubit.dart';
import 'package:flutter_bloc_tuto/cubit/happy_cubit.dart';
import 'package:flutter_bloc_tuto/screens/home.dart';
import 'navigator/routes.dart' as navigator;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<HappyCubit>(
          create: (context) => HappyCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        onGenerateRoute: (settings) =>
            navigator.RouteGenerator.generateRoute(settings),
        initialRoute: Home.routeName,
      ),
    );
  }
}
