import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home.dart';
import 'components/components.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          /// Texts
          const GetStartedText(),

          /// illustration
          Image.asset(
            'assets/yoga_person.png',
            width: 300,
            height: 300,
          ),

          /// buttons
          GetStartedButton(
            onTap: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
        ],
      ),
    );
  }
}
