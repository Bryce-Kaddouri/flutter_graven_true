import 'package:flutter/material.dart';

import 'event_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Welcome in my first app",
            style: TextStyle(fontSize: 42),
          ),
          Text(
            "saloon of bryce from 01/01/2023 to 01/02/2023",
            style: TextStyle(
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
          ),
        ],
      ),
    );
  }
}
