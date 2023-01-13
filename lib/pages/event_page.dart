import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/details_event.dart';

class EventPage extends StatefulWidget {
  const EventPage({
    super.key,
  });

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<Map<String, dynamic>> events = [
    {
      "nameEvent": "Flutter",
      "author": "Google",
      "type": "talk",
      "date": "2021-09-01",
    },
    {
      "nameEvent": "IOS",
      "author": "Apple",
      "type": "talk",
      "date": "2021-09-01",
    },
    {
      "nameEvent": "Android",
      "author": "Google",
      "type": "talk",
      "date": "2021-09-01",
    },
    {
      "nameEvent": "React",
      "author": "Facebook",
      "type": "talk",
      "date": "2021-09-01",
    },
    {
      "nameEvent": "Angular",
      "author": "Google",
      "type": "talk",
      "date": "2021-09-01",
    },
    {
      "nameEvent": "Vue",
      "author": "Google",
      "type": "talk",
      "date": "2021-09-01",
    },
    {
      "nameEvent": "Node",
      "author": "Google",
      "type": "talk",
      "date": "2021-09-01",
    },
    {
      "nameEvent": "Express",
      "author": "Google",
      "type": "talk",
      "date": "2021-09-01",
    },
    {
      "nameEvent": "MongoDB",
      "author": "Google",
      "type": "talk",
      "date": "2021-09-01",
    },
    {
      "nameEvent": "SQL",
      "author": "Google",
      "type": "talk",
      "date": "2021-09-01",
    }
  ];

  void addEventCallback(Map<String, dynamic> event) {
    setState(() {
      events.add(event);
    });
  }

  // systeme de map ou de dictionnaire
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        restorationId: 'details_event',
        itemCount: events.length,
        itemBuilder: (BuildContext context, int index) {
          final event = events[index];
          final nameEvent = event["nameEvent"];
          final authorEvent = event["author"];
          final typeEvent = event["type"];
          final dateEvent = event["date"];
          return Card(
            child: ListTile(
                leading: const FlutterLogo(size: 56.0),
                title: Text('$nameEvent ($typeEvent)'),
                subtitle: Text('$authorEvent - $dateEvent'),
                // icon more_vert pour afficher les options de l'event (modifier, supprimer)

                // trailing: const Icon(Icons.more_vert),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailEvent(
                        nameEvent: nameEvent,
                        authorEvent: authorEvent,
                        typeEvent: typeEvent,
                        dateEvent: dateEvent,
                      ),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
