import 'package:case_app/screens/application_form.dart';
import 'package:case_app/screens/products_and_services.dart';
import 'package:case_app/widgets/faridFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedbackInquiries extends StatefulWidget {
  @override
  _FeedbackInquiriesState createState() => _FeedbackInquiriesState();
}

class _FeedbackInquiriesState extends State<FeedbackInquiries> {
  final formInfo = [];

  addToFormInfo(Map<String, FaridFormField> formMap) {
    formInfo.addAll(formMap.values);
  }

  final Map<String, FaridFormField> formMap = {
    'Company': FaridFormField(
      text: 'Company',
        description: 'required'
    ),


    'Phone No': FaridFormField(
      text: 'Phone No:',
        description: 'Phone number'
    ),
    'Address': FaridFormField(
      text: 'Address',
        description: 'required'
    ),
    'Most visited provider': FaridFormField(
      text: 'Most visited provider',
        description: 'required'
    ),
    'Other provider visited': FaridFormField(
      text: 'Other provider visited',
    )
  };
  TextEditingController _complaintController;
  TextEditingController _complimentsController;
  TextEditingController _inquiryController;


  @override
  void initState() {
    super.initState();
    _complaintController = TextEditingController();
    _complimentsController= TextEditingController();
    _inquiryController= TextEditingController();

  }


  @override
  void dispose() {
    _complimentsController.dispose();
    _complaintController.dispose();
    _inquiryController.dispose();

    super.dispose();
  }
  int groupValue=0;
  FaridFormField cardField= FaridFormField(
  text: 'Card number:',
      description: 'required'
  );


  @override
  Widget build(BuildContext context) {
    // GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      // key: scaffoldKey,
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
      body: ListView(
        shrinkWrap: true,
        children: [

           Row(
             children: [
               Flexible(child: Text('Are you a member?')),
               Flexible(child: RadioListTile(value:0, groupValue: groupValue, onChanged: (value)=>setState((){groupValue=value;}),title: Text('Yes'),)),
               Flexible(child: RadioListTile(value: 1, groupValue: groupValue, onChanged: (value)=>setState(()=>groupValue=value),title: Text('No'),)),
             ],
           ),
           if(groupValue==0)
           cardField,
          ListView.builder(
              shrinkWrap: true,
              itemCount: formMap.values.toList().length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: formMap.values.toList()[index],
                );
              }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:8.0),
            child: TextFormField(
              controller: _complaintController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.green),
                  labelText: 'Complaints:'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:8.0),
            child: TextFormField(
              controller: _complimentsController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.green),
                  labelText: 'Compliments:'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:8.0),
            child: TextFormField(
              controller: _inquiryController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Colors.green),
                  labelText: 'Inquiry:'),
            ),
          ),
          MaterialButton(
            onPressed: () {
              addToFormInfo(formMap);
              //print('${formInfo}');
              formMap.values.toList().forEach((element) {
                printInfo(element);
              });
              //print('Card Number : ${_cardNumber.text}');
              printInfo(cardField);
              print('Complaint : ${_complaintController.text}');
              print('Compliments : ${_complimentsController.text}');
              print('Inquiry : ${_inquiryController.text}');

            },
            color: Colors.green,
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
