import 'dart:io';

import 'package:case_app/core/route_model.dart';
import 'package:case_app/core/size_config.dart';
import 'package:case_app/widgets/choice_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:case_app/core/service_locator.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';

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
          child: ChoiceButtonList(
              isBig: isBig,
              width: width,
              height: height,
              image: image,
              model: model),
        ),
      ),
    );
  }

  push(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}

class ChoiceButtonList extends StatelessWidget {
   ChoiceButtonList({
    Key? key,
    required this.isBig,
    required this.width,
    required this.height,
    required this.image,
    required this.model,
  }) : super(key: key);

  final bool isBig;
  final double width;
  final double height;
  final Image image;
  final RouteModel model;
  var xs = 6;
  
  var sm = 6;
  var md = 6;
  var lg = 6;
  var xl = 6;

  @override
  Widget build(BuildContext context) {
    var sizeConfig = SizeConfig(context);

    return ListView(
      children: [
        SizedBox(
            width: width * 0.5,
            height:  height * 0.2,
            child: FittedBox(child: image)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Align(
            alignment: Alignment.topCenter,
            child: Center(
                child: Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: sizeConfig.blockHeight*3.5),
                    child: ResponsiveGridRow(
                      
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ResponsiveGridCol(
                          xs: xs,
                          lg: lg,
                          sm: sm,
                          md: md,
                          xl: xl,
                          child: ChoiceButton(
                              name: 'Products & Services',
                              onPressed: () {
                                model.isProductsNServcesLoaded = true;
                              }),
                        ),
                        ResponsiveGridCol(
                          xs: xs,
                          lg: lg,
                          sm: sm,
                          md: md,
                          xl: xl,
                          child: ChoiceButton(
                              name: 'Application Form',
                              onPressed: () {
                                model.isApplicationLoaded = true;
                              }),
                        ),
                        ResponsiveGridCol(
                          xs: xs,
                          lg: lg,
                          sm: sm,
                          md: md,
                          xl: xl,
                          child: ChoiceButton(
                              name: 'Feedback & Inquiries',
                              onPressed: () {
                                model.isFeedbackLoaded = true;
                              }),
                        ),
                        ResponsiveGridCol(
                          xs: xs,
                          lg: lg,
                          sm: sm,
                          md: md,
                          xl: xl,
                          child: ChoiceButton(
                              name: 'Quotation',
                              onPressed: () {
                                model.isQuotationLoaded = true;
                              }),
                        ),
                        ResponsiveGridCol(

                          xs: xs,
                          lg: lg,
                          sm: sm,
                          md: md,
                          xl: xl,
                          child: ChoiceButton(
                              name: 'Near Me',
                              onPressed: () {
                                model.isNearbyLoaded = true;
                              }),
                        ),
                        ResponsiveGridCol(
                          xs: xs,
                          lg: lg,
                          sm: sm,
                          md: md,
                          xl: xl,
                          child: ChoiceButton(
                              name: 'Provider Network',
                              onPressed: () {
                                model.isProviderLoaded = true;
                              }),
                        ),
                        ResponsiveGridCol(
                          xs: xs,
                          lg: lg,
                          sm: sm,
                          md: md,
                          xl: xl,
                          child: ChoiceButton(
                              name: 'Contact Us',
                              onPressed: () {
                                model.isContactUsLoaded = true;
                              }),
                        ),
                        ResponsiveGridCol(
                          xs: xs,
                          lg: lg,
                          sm: sm,
                          md: md,
                          xl: xl,
                          child: ChoiceButton(
                              name: 'Claim Form',
                              onPressed: () {
                                model.isClaimLoaded = true;
                              }),
                        ),
                      ],
                    ))),
          ),
        ),
        SizedBox(
          height: 50,
          width: double.infinity,
        )
      ],
    );
  }
}
