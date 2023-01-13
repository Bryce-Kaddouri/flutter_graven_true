import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/add_event_page.dart';
import 'package:flutter_application_1/pages/event_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// _ pour prive
  int _currentIndex = 0;

  // ignore: non_constant_identifier_names
  SetCurrentIndex(int index) {
    // actualisatiuon de l'etat
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: [
            const Text("Home"),
            const Text("Planning"),
            const Text("Add event"),
          ][_currentIndex],
        ),
        body: const [
          HomePage(),
          EventPage(),
          AddEventPage(),
        ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) => SetCurrentIndex(index),
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          iconSize: 32,
          elevation: 10,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: "Planning",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: "Add event",
            ),
          ],
        ),
      ),
    );
  }
}
