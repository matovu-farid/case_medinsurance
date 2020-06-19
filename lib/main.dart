import 'package:case_app/screens/application_form.dart';
import 'package:case_app/screens/choice_form.dart';
import 'package:case_app/screens/feedback_and_inquiries.dart';
import 'package:case_app/screens/products_and_services.dart';
import 'package:case_app/screens/quotation_request.dart';
import 'package:case_app/screens/starting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(CaseApp());
}

class CaseApp extends StatelessWidget {
  MaterialColor color = Colors.lightGreen;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/Starting':(context)=>StartingScreen(),
        '/Choice':(context)=>ChoiceForm(),
        '/Application':(context)=>ApplicationForm(),
        '/Feedback':(context)=>FeedbackInquiries(),
        '/Products':(context)=>ProductAndServices(),
        '/Quotation':(context)=>QuotationRequest()

      },
      theme: ThemeData(
        primarySwatch:color,
      ),
      home: ChoiceForm()
    );
  }
}
