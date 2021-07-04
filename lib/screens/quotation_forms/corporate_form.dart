import 'package:case_app/widgets/farid_dropdown.dart';
import 'package:case_app/widgets/farid_phone_field.dart';
import 'package:case_app/widgets/farid_textfield.dart';
import 'package:flutter/material.dart';

class CorporateForm extends StatelessWidget {
  CorporateForm({
    Key? key,
  }) : super(key: key);

  final corporateList = < Widget>[
   FaridTextField(
      label: 'Company',
    ),
     FaridTextField(
      label: 'No. of lives',
    ),
    FaridTextField(
      label: 'Email',
      type: FieldType.email,
    ),

    FaridTextField(
      label: 'Address',
    ),
    //TODO: implement on phone saved
     FaridPhoneField(),
    FaridDropDown(
      label: 'Type of Business',
      hint: 'Select Type of business',
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
  ];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Center(
            child: Text(
              'Corporate/Group Request:',
              style: TextStyle(
                  color: Colors.green, decorationThickness: 5, fontSize: 18),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              //                                 itemCount: corporateList.length,
              itemCount: corporateList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: corporateList[index],
                );
              }),
          MaterialButton(
            onPressed: () {
              _formKey.currentState!.validate();
            },
            color: Colors.green,
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white, decorationThickness: 5),
            ),
          ),
        ],
      ),
    );
  }
}