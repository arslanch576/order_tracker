import 'package:flutter/material.dart';
import 'package:order_tracker/database/objectbox_database.dart';
import 'package:order_tracker/pages/home.dart';

late ObjectBoxDatabase objectBoxDatabase;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    objectBoxDatabase = await ObjectBoxDatabase.create();
  }catch (e){
    print(e.toString());
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}