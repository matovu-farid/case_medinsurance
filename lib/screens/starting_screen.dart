import 'package:case_app/screens/choice_form.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class StartingScreen extends StatefulWidget {
  @override
  _StartingScreenState createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  Widget build(BuildContext context) {
    return
       
       SplashScreen(
         loadingText: Text("Welcome to Case Medcare"),
          image: Image(image: AssetImage('assets/images/icon.png')),
          photoSize: 200,
        seconds: 10,
        imageBackground: AssetImage('assets/images/background.jpg'),
        
        //routeName: '/Choice',
        navigateAfterSeconds: ChoiceForm(),
       ) ;
  }
}
