import 'package:case_app/widgets/choice_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class ChoiceForm extends StatelessWidget {

   static Image image = Image.asset('assets/images/icon.png');
  static final _logger = Logger('Choice Form');
 
  final choiceBox = {
    'Products & Services': '/Products',
    'Application Form': '/Application',
    'Near Me': '/NearMe',
    'Quotation': '/Quotation',
    'Feedback & Inquires': '/Feedback',
    'Contact Us': '/ContactUs',
    'Provider Network': '/ProviderNetwork',
    'Claim': '/ClaimForm'
  };

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
                  width: isBig?width * 0.7:width * 0.5,
                  height: isBig?height * 0.4:height * 0.2,
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
                              for (var entry in choiceBox.entries)
                                ChoiceButton(nameRoute: entry)
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
