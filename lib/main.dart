import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tuto/logic/cubits/counter/counter_cubit.dart';
import 'package:flutter_bloc_tuto/presentation/screens/home.dart';
import 'package:flutter_bloc_tuto/presentation/navigator/routes.dart'
    as navigator;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
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
