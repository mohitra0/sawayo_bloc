import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sawayo/bloc/bloc_cubit.dart';
import 'package:sawayo/routes/routes.dart';
import 'package:sawayo/view/screen1.dart';

void main() => runApp(BlocProvider(
      create: (context) => LeaveCubit(),
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leave app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Screen1(),
      routes: routes,
    );
  }
}
