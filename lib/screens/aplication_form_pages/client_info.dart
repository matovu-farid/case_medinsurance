import 'package:case_app/classes/aplication_info.dart/application_info.dart';
import 'package:case_app/classes/aplication_info.dart/application_saver.dart';
import 'package:case_app/widgets/date_textfield.dart';
import 'package:case_app/widgets/farid_phone_field.dart';
import 'package:case_app/widgets/farid_radio_tile.dart';
import 'package:case_app/widgets/farid_textfield.dart';
import 'package:flutter/material.dart';

class ClientInfo extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final PageController controller;
  ClientInfo(
    this.formKey,
    this.controller, {
    Key? key,
  }) : super(key: key);
  var clientInfo = ClientData();
  var saver = ClientDataSaver.instance;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 3),
      children: [
        FaridTextField(
            label: 'Company',
            onSaved: (company) {
              if (company != null) saver.company(company);
            }),
        FaridTextField(
            label: "Main Member's Name",
            onSaved: (name) {
              if (name != null) saver.name(name);
            }),
        FaridPhoneField(
          onSaved: (number) {
            if (number != null) {
              saver.phonenumber(number.completeNumber);
            }
          },
        ),
        FaridDateField(
          hint: 'DateOfBirth',
          onSaved: (date) {
            if (date != null) saver.dateOfBirth(date);
          },
        ),
        FaridRadioTile(
          label: 'Gender',
          radioList: ['Male', 'Female'],
          initCall: () {
            saver.gender('Male');
          },
          onChanged: (gender) {
            if (gender != null) saver.gender(gender);
          },
        ),
        FaridTextField(
          label: 'Email',
          type: FieldType.email,
          onSaved: (email) {
            if (email != null) saver.email(email);
          },
        ),
        FaridTextField(
          label: 'Address',
          onSaved: (address) {
            if (address != null) saver.address(address);
          },
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Text(
        //       'Information regarding any Pre-existing medical conditions, regular medication,surgical operations:'),
        // ),
        // FaridTextField(
        //   label: '',
        // ),
      ],
    );
  }
}
