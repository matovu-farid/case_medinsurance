import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class StartingScreen extends StatefulWidget {
  @override
  _StartingScreenState createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MySplashScreen());
  }
}

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 7),()=>Navigator.of(context).pushNamed("/Choice"));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.jpg')),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Image(
                image: AssetImage('assets/images/icon.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
