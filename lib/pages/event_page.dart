import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/details_event.dart';
import 'edit_event.dart';

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

    // callback pour supprimer un event de la liste des events (en utilisant l'index) et de la liste des events dans la page details_event (en utilisant l'id)
    void deleteEventCallback(int index) {}
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
                trailing: PopupMenuButton<int>(
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: ListTile(
                        leading: Icon(Icons.edit, color: Colors.blue),
                        title: Text("Edit"),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: ListTile(
                        leading: Icon(Icons.delete, color: Colors.red),
                        title: Text("Delete"),
                      ),
                    ),
                  ],
                  onSelected: (int value) {
                    if (value == 1) {
                      // redirect to the edit page of the event with the event data  AND THE INDEX OF THE EVENT IN THE LIST OF EVENTS using Navigator.push() method of the Navigator class.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditEvent(
                            nameEvent: nameEvent,
                            author: authorEvent,
                            type: typeEvent,
                            date: dateEvent,
                            index: index,
                            callback: addEventCallback,
                          ),
                        ),
                      );
                    } else if (value == 2) {
                      // delete the event from the list of events and update the state of the widget tree to rebuild the UI with the new list of events using setState() method of the State class.
                      print("delete");
                      // setState(() {
                      //events.removeAt(index);
                      //});

                      // use the callback function to delete the event from the list of events in the details_event page
                      deleteEventCallback(index);
                    }
                  },
                ),
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

  // callback pour supprimer un event de la liste des events (en utilisant l'index) et de la liste des events dans la page details_event (en utilisant l'id)

  void deleteEventCallback(int index) {
    setState(() {
      events.removeAt(index);
    });

// callback to add an event to the list of events and update the state of the widget tree to rebuild the UI with the new list of events using setState() method of the State class.
    void addEventCallback(Map<String, dynamic> event) {
      setState(() {
        events.add(event);
      });
    }
  }
}
