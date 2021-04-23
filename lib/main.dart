import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:life_hacks/models/Persons.dart';
import 'package:life_hacks/providers/Providers.dart';
import 'package:life_hacks/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  // widgets
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List? data;

  Future<String?> loadJsonData() async {
    var jsonText = await rootBundle.loadString('json/quotes.json');
    data = json.decode(jsonText);
    AppData().setQuotes(data!);
  }

  @override
  void initState() {
    this.loadJsonData();
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ///inspection provider
        ChangeNotifierProvider<Person>(
          create: (BuildContext context) => Person(),
        ),
        ChangeNotifierProvider<AppData>(
          create: (BuildContext context) => AppData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quotes World',
        theme: ThemeData.dark(),
        home: Home(),
      ),
    );
  }
}
