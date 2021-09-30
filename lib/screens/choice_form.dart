import 'package:case_app/screens/products_and_services.dart';
import 'package:case_app/widgets/choice_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:case_app/core/service_locator.dart';
import 'package:case_app/screens/forms/aplication_form_pages/application_form.dart';
import 'package:case_app/screens/choice_form.dart';
import 'package:case_app/screens/forms/claim.dart';
import 'package:case_app/screens/provider_network.dart';
import 'package:case_app/screens/contact_us.dart';
import 'package:case_app/screens/forms/feedback_and_inquiries.dart';
import 'package:case_app/screens/near_me.dart';
import 'package:case_app/screens/forms/quotation_forms/quotation_request.dart';


class ChoiceForm extends StatelessWidget {
  static Image image = Image.asset('assets/images/icon.png');
  static final _logger = Logger('Choice Form');

  
  late bool isBig;

  @override
  Widget build(BuildContext context) {
    //ProviderNetworkBloc(Position()).setMarkers();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    isBig = (width < 1008) ? false : true;

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
                              // for (var entry in choiceBox.entries)
                              //   ChoiceButton(nameRoute: entry)
                              ChoiceButton(
                                  name: 'Products & Services',
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
                                                ProductAndServices()));
                                  }),
                              ChoiceButton(
                                  name: 'Application Form',
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
                                                ApplicationForm()));
                                  }),
                              ChoiceButton(
                                  name: 'Feedback & Inquiries',
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
                                                FeedbackInquiries()));
                                  }),
                              ChoiceButton(
                                  name: 'Quotation',
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
                                                QuotationRequest()));
                                  }),
                              ChoiceButton(
                                  name: 'Near Me',
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
                                                NearMe()));
                                  }),
                              ChoiceButton(
                                  name: 'Provider Network',
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
                                                ProviderNetwork()));
                                  }),
                              ChoiceButton(
                                  name: 'Contact Us',
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
                                                ContactUs()));
                                  }),
                              ChoiceButton(
                                  name: 'Claim Form',
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>
                                                ClaimForm()));
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
}
