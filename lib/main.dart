import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:namer_app/list.dart';
import 'package:provider/provider.dart';
import 'package:namer_app/config/Routes.dart' as Routing;
import 'package:namer_app/detail.dart';
import 'package:namer_app/other.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 23, 15, 139)),
        ),
        initialRoute: '/', // Set the initial route
        routes: {
          '/': (context) => MyHomePage(), // Register the '/' route
          '/detail': (context) => DetailScreen(), // Register the '/detail' route
          '/list': (context) => ListScreen(), // Register the '/other' route
          '/other': (context) => OtherScreen(),
        },
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  // var current = WordPair.random();

  void getNext() {
    // current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var appState = context.watch<MyAppState>();
    // var pair = appState.current;

    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/back/IMG_0073.PNG'),
              fit: BoxFit.cover)),
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 380.0, 0.0, 0.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/list'),
                child: Image.asset('assets/images/icon/start.png', width: 420.0),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/other'),
                child: Image.asset('assets/images/icon/other.png', width: 350.0),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
