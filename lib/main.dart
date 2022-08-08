import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tuto/logic/cubits/counter/counter_cubit.dart';
import 'package:flutter_bloc_tuto/logic/cubits/internet/internet_cubit.dart';
import 'package:flutter_bloc_tuto/presentation/screens/home.dart';
import 'package:flutter_bloc_tuto/presentation/navigator/routes.dart' as navigator;

void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  const MyApp({Key? key, required this.connectivity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
            create: (context) => CounterCubit(internetCubit: context.read<InternetCubit>())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        onGenerateRoute: (settings) => navigator.RouteGenerator.generateRoute(settings),
        initialRoute: Home.routeName,
      ),
    );
  }
}
