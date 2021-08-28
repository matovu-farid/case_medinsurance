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
    return Stack(
      fit: StackFit.expand,
      children: [
        Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/background.jpg')),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Image(
                image: AssetImage('assets/images/icon.png'),
              ),
            ),
          ),
        )
      ],
    );
  }
}
