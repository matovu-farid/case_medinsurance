import 'dart:io';

import 'package:case_app/core/route_model.dart';
import 'package:case_app/widgets/choice_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:case_app/core/service_locator.dart';
import 'package:provider/provider.dart';

class ChoiceForm extends StatelessWidget {
  static final _logger = Logger('Choice Form');

  late bool isBig;

  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS)
        ? CupertinoPageScaffold(child: MainBody())
        : MainBody();
  }
}

class MainBody extends StatelessWidget {
  static Image image = Image.asset('assets/images/icon.png');

  @override
  Widget build(BuildContext context) {
      final model = context.read<RouteModel>();

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var isBig = (width < 1008) ? false : true;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.jpg'))),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: ListView(
            children: [
              SizedBox(
                  width: isBig ? width * 0.7 : width * 0.5,
                  height: isBig ? height * 0.4 : height * 0.2,
                  child: FittedBox(child: image)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Center(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 20),
                          child: GridView(
                            physics: ClampingScrollPhysics(),
                            gridDelegate: (width) > 1008
                                ? SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 400,
                                    mainAxisExtent: 100)
                                : SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 2, crossAxisCount: 2),
                            children: [
                              ChoiceButton(
                                  name: 'Products & Services',
                                  onPressed: () {
                                    model.isProductsNServcesLoaded = true;
                                  }),
                              ChoiceButton(
                                  name: 'Application Form',
                                  onPressed: () {
                                    model.isApplicationLoaded = true;
                                  }),
                              ChoiceButton(
                                  name: 'Feedback & Inquiries',
                                  onPressed: () {
                                    model.isFeedbackLoaded = true;
                                  }),
                              ChoiceButton(
                                  name: 'Quotation',
                                  onPressed: () {
                                    model.isQuotationLoaded = true;
                                  }),
                              ChoiceButton(
                                  name: 'Near Me',
                                  onPressed: () {
                                    model.isNearbyLoaded = true;
                                  }),
                              ChoiceButton(
                                  name: 'Provider Network',
                                  onPressed: () {
                                    model.isProviderLoaded = true;
                                  }),
                              ChoiceButton(
                                  name: 'Contact Us',
                                  onPressed: () {
                                    model.isContactUsLoaded = true;
                                  }),
                              ChoiceButton(
                                  name: 'Claim Form',
                                  onPressed: () {
                                    model.isClaimLoaded = true;
                                  }),
                            ],
                          ))),
                ),
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }

  push(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}
