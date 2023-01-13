import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  // systeme de map ou de dictionnaire
  final events = [
    {
      "speaker": "Bryce Kaddouri",
      "date": "13h à 13h30",
      "subject": "Le code Legacy",
      "avatar": "lior",
    },
    {
      "speaker": "Brayan Kaddouri",
      "date": "17h à 17h30",
      "subject": "git blame --no-offense",
      "avatar": "damien",
    },
    {
      "speaker": "Defend Intelligence",
      "date": "18h à 18h30",
      "subject": "A la découverte de la blockchain",
      "avatar": "defendinteligence",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          final speaker = event["speaker"];
          final date = event["date"];
          final subject = event["subject"];
          return Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('$speaker ($date)'),
              subtitle: Text('$subject'),
              trailing: Icon(Icons.more_vert),
            ),
          );
        },
      ),
    );
  }
}
