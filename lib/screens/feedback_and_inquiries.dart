import 'package:case_app/screens/products_and_services.dart';
import 'package:case_app/widgets/faridFormField.dart';
import 'package:flutter/material.dart';

class FeedbackInquiries extends StatefulWidget {
  @override
  _FeedbackInquiriesState createState() => _FeedbackInquiriesState();
}

class _FeedbackInquiriesState extends State<FeedbackInquiries> {
  final Map<String,FaridFormField> formMap = {
    'Company':FaridFormField(
      text: 'Company',
    ),
    'Are you a member?':FaridFormField(
      text: 'Are you a member?',
      isRadioBtton: true,
      radioList: [
        {'Yes': 0},
        {'No': 1}
      ],
    ),
    'fill your card number':FaridFormField(
      text: 'If a member,fill your card number:',
    ),
    'Phone No':FaridFormField(
      text: 'Phone No:',
    ),
    'Address/Location':FaridFormField(
      text: 'Address/Location',
    ),
    'Most visited provider':FaridFormField(
      text: 'Most visited provider',
    ),
    'Other provider visited':FaridFormField(
      text: 'Other provider visited',
    )
  };

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightGreen[200],
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: ProductAndServices.partImage),
              ],
            ),
            Text(
              'FEEDBACK & INQUIRIES',
              style: TextStyle(color: Colors.lightGreen[400]),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: formMap.values.toList().length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: formMap.values.toList()[index],
                );
              }),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.green),
                labelText: 'Complaints:'),
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.green),
                labelText: 'Compliments:'),
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.green),
                labelText: 'Inquiry:'),
          ),
          MaterialButton(
            onPressed: (){
              scaffoldKey.currentState.showBottomSheet((context) =>
                  Container(
                    width: double.infinity,
                    color: Colors.green[200],
                      child: Text('Thank you \n Our team will contact you for any clarification')));
            },
            color: Colors.green,
            child:Text('Submit',style: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }
}
