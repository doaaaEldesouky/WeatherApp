import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget
{
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('There is No weather 🙁',style: TextStyle(
              fontSize: 30
            ),),
            Text('Searching now 🔎',style: TextStyle(
                fontSize: 30
            ),),
          ],

        ),
      ),
    );
  }

}