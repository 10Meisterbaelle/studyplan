import 'package:flutter/material.dart';
import 'package:studyplan/edit.dart';

import 'add.dart';
import 'database.dart';
import 'state.dart';

final StringListDatabase database = StringListDatabase();
List<String> homeworkList = <String>[]; // Creates the list of homework
// TODO: Don't forget to remove list items!

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await database.open();
  runApp(const MyApp());
}

final GlobalKey<MyHomePageState> myHomePageKey = GlobalKey<MyHomePageState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final observer = DatabaseLifecycleObserver(database);
    WidgetsBinding.instance.addObserver(observer);
    return MaterialApp(
      title: 'StudyPlan',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Homework'),
        '/add': (context) => const Add(),
        '/edit': (context) => const Edit(),
      },
      // home: const MyHomePage(title: 'Homework'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}
