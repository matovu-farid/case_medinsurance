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
      description: 'required',

    ),
    'No. of lives': FaridFormField(
      text: 'No. of lives',
        description: 'required'
    ),
    'Email': FaridFormField(
      text: 'Email',
      description: 'email',
    ),
    'Company': FaridFormField(
      text: 'Company',
      description: 'required',
    ),
    'Address': FaridFormField(
      text: 'Address',
        description: 'required'
    ),
    'Phone No': FaridFormField(
      text: 'Phone No',
        description: 'Phone number'
    ),
    'Type of business': FaridFormField(
     // text: 'business',
      description: 'required',

      text: 'Type of Business',
      hint: 'Select Type of business',
        isDropdown: true,

      dropdownNames: [
        'NGO',
        'Government Body',
        'School',
        'Manufacturing',
        'Religious institution',
        'Financial institution',
        'Sacco',
        'Other '
      ],
    ),

  };

  final Map<String,FaridFormField> individualMap= {
    'Name': FaridFormField(
      text: 'Name',
        description: 'required'
    ),
    'Phone No':FaridFormField(
      text: 'Phone No',
        description: 'Phone number'
    ),
    'Email':FaridFormField(
      text: 'Email',
      description: 'email',
    ),
    'Age Bracket':FaridFormField(
      text: 'Age Bracket',
        description: 'required'
    ),
    'Cover Type':FaridFormField(
      text: 'Cover Type',
        description: 'required',
        isDropdown:true,
      hint: 'Select Cover type',
      dropdownNames: [
        'Individual Cover',
        'Family Cover',
        'Antenatal Cover',
        'Antenatal & Delivery Package',
        'Short-term Cover',
        'Elderly Cover',
        'Hypertension Package',
        'Hypertension & Diabetes Package',
      ],
    ),

  };
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      key: _formKey,
        appBar: AppBar(
          backgroundColor: Colors.white,

          centerTitle: true,
          title: Text("Quotation Request",
            style: TextStyle(color:  Colors.white,),
        ),),
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
                    Flexible(
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
                    Flexible(
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
                    _formKey.currentState.validate();
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
