import 'package:case_app/bloc/quotation_index.dart';
import 'package:case_app/bloc/send_mail.dart';
import 'package:case_app/screens/application_form.dart';
import 'package:case_app/screens/choice_form.dart';
import 'package:case_app/screens/claim.dart';
import 'package:case_app/screens/provider_network.dart';
import 'package:case_app/screens/contact_us.dart';
import 'package:case_app/screens/feedback_and_inquiries.dart';
import 'package:case_app/screens/products_and_services.dart';
import 'package:case_app/screens/near_me.dart';
import 'package:case_app/screens/quotation_request.dart';
import 'package:case_app/screens/starting_screen.dart';
import 'package:case_app/widgets/my_indicator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:logging/logging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:case_app/bloc/application_form_index.dart';

main(List<String> args) {
  Logger.root.onRecord.listen((record) {
    print('_' * 100);
    print('${record.loggerName} : ${record.message}');
    print('_' * 100);
  });

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_)=>QuotationIndex()),
      BlocProvider(create: (_)=>ApplicationIndex())

    ],

    child: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (cotentext, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) return CaseApp();
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
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightGreen[400]
      ),
        home: Scaffold(
      body: Center(
        child: MyIndicator(Indicator.ballZigZag),
      ),
    ));
  }
}

class CaseApp extends StatelessWidget  {
  MaterialColor color = Colors.lightGreen;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.signInAnonymously(),
        builder: (context, snapshot) {
          if(snapshot.connectionState ==ConnectionState.done)
          return KeyboardDismisser(
            gestures: [GestureType.onPanDown],
            child: MaterialApp(
              routes: {
                '/': (context) => StartingScreen(),
                '/Choice': (context) => ChoiceForm(),
                '/Application': (context) => ApplicationForm(),
                '/Feedback': (context) => FeedbackInquiries(),
                '/Products': (context) => ProductAndServices(),
                '/Quotation': (context) => QuotationRequest(),
                '/NearMe': (context) => NearMe(),
                '/ProviderNetwork': (context) => ProviderNetwork(),
                '/ContactUs': (context) => ContactUs(),
                '/ClaimForm': (context) => ClaimForm(),
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
