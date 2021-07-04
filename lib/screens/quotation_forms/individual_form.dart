import 'package:case_app/widgets/farid_dropdown.dart';
import 'package:case_app/widgets/farid_phone_field.dart';
import 'package:case_app/widgets/farid_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IndividualForm extends StatelessWidget {
  IndividualForm({
    Key? key,
  }) : super(key: key);

  final List< Widget> individualList = [
     FaridTextField(
      label: 'Name',
    ),
    //TODO: replace with number
     FaridPhoneField(
     
    ),
    FaridTextField(
      label: 'Email',
      type: FieldType.email,
    ),
    FaridTextField(
      label: 'Age Bracket',
    ),
    FaridDropDown(
      label: 'Cover Type',
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
  ];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Center(
            child: Text(
              'Individual Request:',
              style: TextStyle(
                  color: Colors.green, decorationThickness: 5, fontSize: 18),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: individualList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: individualList[index],
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