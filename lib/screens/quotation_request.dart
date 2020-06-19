import 'package:case_app/widgets/faridFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'application_form.dart';



class QuotationRequest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuotationRequestState();
  }
}

class QuotationRequestState extends State<QuotationRequest> {
  int groupvalue = 0;
//  Iterator<FaridFormField> get iter=> corporateList.iterator;
  final corporateMap = <String, FaridFormField>{
    'Company': FaridFormField(
      text: 'Company',
    ),
    'No. of lives': FaridFormField(
      text: 'No. of lives',
    ),
    'Email': FaridFormField(
      text: 'Email',
    ),
    'Phone No': FaridFormField(
      text: 'Company',
    ),
    'Address': FaridFormField(
      text: 'Address',
    ),
    'Phone No': FaridFormField(
      text: 'Phone No',
    ),

  };

//  final List<FaridFormField> corporateList = [
//    FaridFormField(
//      text: 'Company',
//    ),
//    FaridFormField(
//      text: 'No. of Lives',
//    ),
//    FaridFormField(
//      text: 'Email',
//    ),
//    FaridFormField(
//      text: 'Phone No',
//    ),
//    FaridFormField(
//      text: 'Address/Location',
//    ),
//    FaridFormField(
//      text: 'Types of Business',
//    ),
//    FaridFormField(
//      text: 'Contact Name',
//    ),
//  ];
  final Map<String,FaridFormField> individualMap= {
    'Name': FaridFormField(
      text: 'Name',
    ),
    'Phone No':FaridFormField(
      text: 'Phone No',
    ),
    'Email':FaridFormField(
      text: 'Email',
    ),
    'Age Bracket':FaridFormField(
      text: 'Age Bracket',
    ),
    'Cover Type':FaridFormField(
      text: 'Cover Type',
    ),
  };

  @override
  Widget build(BuildContext context) {

    return  Scaffold(



        appBar: AppBar(
          backgroundColor: Colors.lightGreen[200],

          centerTitle: true,
          title: Text("Quotation Request",
            style: TextStyle(color: Colors.lightGreen[400]),),
        ),
        body: Container(

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 1,
                child: Center(
                  child: Text(
                    'Product Category:',
                    style: TextStyle(
                        color: Colors.green,
                        decorationThickness: 5,
                        fontSize: 18),
                  ),
                ),
              ),
              Flexible
                (
                flex: 1,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: RadioListTile(
                          title: Text('Corporate'),
                          value: 1,
                          groupValue: groupvalue,
                          onChanged: (value) {
                            setState(() {
                              groupvalue = value;
                            });
                          }),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: RadioListTile(
                          title: Text('Individual'),
                          value: 0,
                          groupValue: groupvalue,
                          onChanged: (value) {
                            setState(() {
                              groupvalue = value;
                            });
                          }),
                    ),
                  ],
                ),
              ),


              Flexible(
                flex: 7,
                child: Builder(
                    builder:(context){
                     return (groupvalue==1)?
                         ListView(

                           children:<Widget>[
                             Center(
                               child: Text(
                                 'Corporate/Group Request:',
                                 style: TextStyle(
                                     color: Colors.green,
                                     decorationThickness: 5,
                                     fontSize: 18),
                               ),
                             ),
                             ListView.builder(
                                 shrinkWrap: true,
//                                 itemCount: corporateList.length,
                                 itemCount: corporateMap.values.toList().length,
                                 itemBuilder: (context,index){
                                   return ListTile(
                                     title: corporateMap.values.toList()[index],
                                   );
                                 }),
                           ],
                         )
                         :
                         ListView(
                           shrinkWrap: true,
                           children: <Widget>[
                             Center(
                               child: Text(
                                 'Individual Request:',
                                 style: TextStyle(
                                     color: Colors.green,
                                     decorationThickness: 5,
                                     fontSize: 18),
                               ),
                             ),

                             ListView.builder(
                                 shrinkWrap: true,
                                 itemCount: individualMap.values.toList().length,
                                 itemBuilder: (context,index){
                                   return ListTile(
                                     title: individualMap.values.toList()[index],
                                   );
                                 }),
                              ],
                         )
                     ;

                }),
              ),
              Flexible(
                flex: 1,
                child: MaterialButton(
                  onPressed: (){
                   if (groupvalue==0){
                     for(var field in individualMap.values.toList()){
                       print('Individual');
                       printInfo(field);
                     }
                   }else
                    {for(var field in corporateMap.values.toList()){
                      print('Corporate');
                      printInfo(field);
                    }}
                  },
                  color: Colors.green,
                  child: Text('Submit',
                  style: TextStyle(color: Colors.white
                  ,decorationThickness: 5),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ;
  }
}
