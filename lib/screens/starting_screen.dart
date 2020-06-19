import 'package:flutter/material.dart';

class StartingScreen extends StatefulWidget {
  @override
  _StartingScreenState createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  final startingImage = Image.asset('assets/images/CASE-Medcare-welcome-page.png');
  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
         body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FittedBox(
              child: startingImage),
         ),
       )
    ;
  }
}
