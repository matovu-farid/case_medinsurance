import 'package:case_app/screens/application_form.dart';
import 'package:case_app/screens/choice_form.dart';
import 'package:case_app/screens/provider_network.dart';
import 'package:case_app/screens/contact_us.dart';
import 'package:case_app/screens/feedback_and_inquiries.dart';
import 'package:case_app/screens/products_and_services.dart';
import 'package:case_app/screens/near_me.dart';
import 'package:case_app/screens/quotation_request.dart';
import 'package:case_app/screens/starting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:logging/logging.dart';


main(List<String> args) {
  Logger.root.onRecord.listen((record) {
    print('_' * 100);
    print('${record.loggerName} : ${record.message}');
    print('_' * 100);
  });
  WidgetsFlutterBinding.ensureInitialized();

  runApp(CaseApp());
}

class CaseApp extends StatelessWidget {
  MaterialColor color = Colors.lightGreen;
  @override
  Widget build(BuildContext context) {
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
                '/ContactUs': (context) => ContactUs()
              },
              theme: ThemeData(
                primarySwatch: color,
              ),
              ),
    );
  }
}
