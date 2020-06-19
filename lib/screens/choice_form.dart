import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChoiceForm extends StatelessWidget {

  static Image image = Image.asset('assets/images/CASE-LOGO-full.png');
  final choiceBox = [
    {'Products & Services':'/Products'},
    {'Application Form': '/Application'},
    {'Provider Network': '/Quotation'},
    {'Quotation': '/Quotation'},
    {'Feedback & Inquires': '/Feedback'},
    {'Contact us':' /Feedback'}
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.2,
              child: FittedBox(child: image)),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.8,
            child: Align(
              alignment: Alignment.topCenter,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    itemCount: choiceBox.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.height/2),
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, left: 0, right: 0),
                        child: MaterialButton(
                          //choiceBox[index][choiceBox[index].keys.first]

                          onPressed: (){
                            Navigator.of(context).pushNamed(choiceBox[index][choiceBox[index].keys.first]);
                          },
                          child: Container(
                            color: Colors.green,
                            child: Center(
                                child: Text('${choiceBox[index].keys.first}')),
                          ),
                        ),
                      );
                    }),
              )),
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
