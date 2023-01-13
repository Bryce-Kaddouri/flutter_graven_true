import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailEvent extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: $nameEvent'),
            Text('Author: $authorEvent'),
            Text('Type: $typeEvent'),
            Text('Date: $dateEvent'),
            const Text('test cest juste pour qssier'),
          ],
        ),
      ),
    );
  }
}
