import 'dart:io';

import 'dart:io';

import 'package:case_app/core/route_delegate.dart';
import 'package:case_app/core/route_model.dart';
import 'package:case_app/core/service_locator.dart';
import 'package:case_app/screens/choice_form.dart';
import 'package:case_app/screens/forms/feedback_and_inquiries.dart';
import 'package:case_app/screens/forms/quotation_forms/quotation_request.dart';
import 'package:case_app/screens/products_and_services.dart';

import 'package:case_app/widgets/my_indicator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:logging/logging.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'core/provider.dart';
import 'screens/contact_us.dart';
import 'screens/forms/aplication_form_pages/application_form.dart';
import 'screens/forms/claim.dart';
import 'screens/near_me.dart';
import 'screens/provider_network.dart';
import 'package:provider/provider.dart';
main(List<String> args) {
  Logger.root.onRecord.listen((record) {
    print('_' * 100);
    print('${record.loggerName} : ${record.message}');
    print('_' * 100);
  });
  setup();

  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (_)=>getIt<RouteModel>(),
    child: Providers(child: InitializedApp())));
  }

class InitializedApp extends StatelessWidget {
  const InitializedApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (cotentext, snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
            return CaseApp();
          return InnitialLoading();
        });
  }
}

class InnitialLoading extends StatelessWidget {
  const InnitialLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyIndicator(Indicator.ballZigZag),
        ),
      ),
    );
  }
}

class CaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.signInAnonymously(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
            return KeyboardDismisser(
              gestures: [GestureType.onPanDown],
              child: (Platform.isIOS)?CupertinoApp(
                theme: CupertinoThemeData(
                  primaryColor: Colors.green),
                home: MaterialApp(
                                   theme : ThemeData(primarySwatch: Colors.green),

                  home: Card(child: Router(routerDelegate: MyRouterDelegate())))
              ):
              MaterialApp(

                theme : ThemeData(primarySwatch: Colors.green),
                home: Router(routerDelegate: MyRouterDelegate())),
            );
          return InnitialLoading();
        });
  }
}
