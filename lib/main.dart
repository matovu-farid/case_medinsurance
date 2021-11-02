
import 'dart:io';

import 'package:case_app/core/service_locator.dart';
import 'package:case_app/screens/choice_form.dart';

import 'package:case_app/widgets/my_indicator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:logging/logging.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'core/provider.dart';

main(List<String> args) {
  Logger.root.onRecord.listen((record) {
    print('_' * 100);
    print('${record.loggerName} : ${record.message}');
    print('_' * 100);
  });
  setup();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(Providers(
    
    child: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (cotentext, snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
            return CaseApp();
          return InnitialLoading();
        }),
  ));
}

class InnitialLoading extends StatelessWidget {
  const InnitialLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return MaterialApp(
        
      debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.lightGreen[400]),
        home: CupertinoApp(
          home: Scaffold(
            body: Center(
              child: MyIndicator(Indicator.ballZigZag),
            ),
          ),
        ));
    }
    return MaterialApp(
    
      debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.lightGreen[400]),
        home: Scaffold(
          body: Center(
            child: MyIndicator(Indicator.ballZigZag),
          ),
        ));
  }
}

class CaseApp extends StatelessWidget {
  MaterialColor color = Colors.green;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.signInAnonymously(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
            return KeyboardDismisser(
              gestures: [GestureType.onPanDown],
              child: MaterialApp(
                      debugShowCheckedModeBanner: false,

                routes: {
                  '/': (context) => ChoiceForm(),
                  '/Choice': (context) => ChoiceForm(),
                  
                },
                theme: ThemeData(
                  primarySwatch: color,
                  
                ),
              ),
            );
          return InnitialLoading();
        });
  }
}
