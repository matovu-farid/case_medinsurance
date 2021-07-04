import 'package:case_app/classes/application_info.dart';
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

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 3),
      children: [
        FaridTextField(
          label: 'Company',
        ),
        FaridTextField(
          label: "Main Member's Name",
        ),
        //TODO: add onSaved
        FaridPhoneField(),
        //TODO: handle date of birth
        FaridDateField(
          hint: 'DateOfBirth',
          dateKeeper: DateKeeper(),
        ),
        FaridRadioTile(
          label: 'Gender',
          radioList: ['Male', 'Female'],
        ),
        FaridTextField(
          label: 'Email',
          type: FieldType.email,
        ),
        FaridTextField(
          label: 'Address',
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              'Information regarding any Pre-existing medical conditions, regular medication,surgical operations:'),
        ),
        FaridTextField(
          label: '',
        ),
      ],
    );
  }
}
