import 'package:flutter/material.dart';
import 'src/pages/homePage.dart';


final GlobalKey<ScaffoldMessengerState> wellcomeMessage =
    GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: wellcomeMessage,
      home: Scaffold(
        /*appBar: AppBar(
          title: const Text('Tasca 02',textAlign: TextAlign.center, ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),*/
        body: HomePage(),
      ),
    );
  }
}

 




