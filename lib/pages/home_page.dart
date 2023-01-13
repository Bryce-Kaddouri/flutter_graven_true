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
            "Bienvenue in my first app",
            style: TextStyle(fontSize: 42),
          ),
          Text(
            "salon de bryce du 21 au 27 2022",
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
