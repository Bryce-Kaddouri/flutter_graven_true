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
      "date": "from 07:30 AM to 10 AM",
      "subject": "the Legacy code",
      "avatar": "lior",
    },
    {
      "speaker": "Brayan Kaddouri",
      "date": "from 10 AM to 02:30 PM",
      "subject": "git blame --no-offense",
      "avatar": "damien",
    },
    {
      "speaker": "Defend Intelligence",
      "date": "from 02:30 PM to 06:30 PM",
      "subject": "Discovering the blockchain",
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
              leading: const FlutterLogo(size: 56.0),
              title: Text('$speaker ($date)'),
              subtitle: Text('$subject'),
              trailing: const Icon(Icons.more_vert),
            ),
          );
        },
      ),
    );
  }
}
