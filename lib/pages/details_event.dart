import 'package:flutter/material.dart';

class DetailEvent extends StatefulWidget {
  String nameEvent;
  String authorEvent;
  String typeEvent;
  String dateEvent;

  DetailEvent({
    super.key,
    required this.nameEvent,
    required this.authorEvent,
    required this.typeEvent,
    required this.dateEvent,
  });

  @override
  State<DetailEvent> createState() => _DetailEventState();
}

class _DetailEventState extends State<DetailEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${widget.nameEvent}'),
            Text('Author: ${widget.authorEvent}'),
            Text('Type: ${widget.typeEvent}'),
            Text('Date: ${widget.dateEvent}'),
          ],
        ),
      ),
    );
  }
}
