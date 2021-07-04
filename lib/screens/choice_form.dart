import 'package:case_app/bloc/send_mail.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:logging/logging.dart';


class ChoiceForm extends StatelessWidget {
  static Image image = Image.asset('assets/images/icon.png');
  final choiceBox = [
    {'Products & Services': '/Products'},
    {'Application Form': '/Application'},
    {'Near Me': '/NearMe'},
    {'Quotation': '/Quotation'},
    {'Feedback & Inquires': '/Feedback'},
    {'Contact Us': '/ContactUs'},
    {'Provider Network': '/ProviderNetwork'},
    {'Claim': '/ClaimForm'}
  ];
  static final _logger = Logger('Choice Form');

  @override
  Widget build(BuildContext context) {
    //ProviderNetworkBloc(Position()).setMarkers();
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.jpg'))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: ListView(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: FittedBox(child: image)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 20),
                    child: GridView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: choiceBox.length,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 2,
                                crossAxisCount: 2),
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 8,
                                  left: 0,
                                  right: 0),
                              child: MaterialButton(
                                //choiceBox[index][choiceBox[index].keys.first]

                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      choiceBox[index][
                                          choiceBox[index]
                                              .keys
                                              .first]!);
                                },
                                splashColor: Colors.amber,
                                hoverColor: Colors.red[200],
                                //highlightColor: ,

                                child: Container(
                                  color: Colors.green,
                                  child: Center(
                                      child: Padding(
                                    padding:
                                        const EdgeInsets.all(8.0),
                                    child: Text(
                                      '${choiceBox[index].keys.first}',
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18),
                                    ),
                                  )),
                                ),
                              ),
                            )),
                  )),
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
