import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibtekar_task/screens/home_page.dart';
import 'package:ibtekar_task/storage/hive_storage_helper.dart';

import 'blocs/people_bloc.dart';
import 'blocs/people_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HiveStorage().createHive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ibtikar Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => PeopleBloc(EmptyState()),
        child: MyHomePage(),
      ),
    );
  }
}
