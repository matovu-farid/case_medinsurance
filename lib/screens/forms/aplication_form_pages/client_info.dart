import 'package:case_app/bloc/application/application_bloc.dart';
import 'package:case_app/bloc/form_bloc/input_form_events.dart';
import 'package:case_app/classes/aplication_info.dart/application_info.dart';
import 'package:case_app/core/service_locator.dart';
import 'package:case_app/widgets/fields/date_textfield.dart';
import 'package:case_app/widgets/fields/farid_phone_field.dart';
import 'package:case_app/widgets/fields/farid_radio_tile.dart';
import 'package:case_app/widgets/fields/farid_textfield.dart';
import 'package:flutter/material.dart';

class ClientInfo extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  
  ClientInfo(
    this.formKey,
     {
    Key? key,
  }) : super(key: key);
  var clientInfo = ClientData();
  late final bloc = getIt<ApplicationBloc>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 3),
      children: [
        FaridTextField(
            label: 'Company',
            onSaved: (company) {
              bloc.add(InputCompany(company));
            }),
        FaridTextField(
          label: "Main Member's Name",
          onSaved: (text) {
            bloc.add(InputName(text));
          },
        ),
        FaridPhoneField(
          onSaved: (number) {
            bloc.add(InputPhoneNumber(number?.completeNumber));
          },
        ),
        FaridDateField(
          label: 'Date of Birth',
          onSaved: (date) {
            bloc.add(InputDateOfBirth(date));
          },
        ),
        FaridRadioTile(
          label: 'Gender',
          radioList: ['Male', 'Female'],
          initCall: () {
            bloc.add(InputGender('Male'));
          },
          onChanged: (gender) {
            bloc.add(InputGender(gender));
          },
        ),
        FaridTextField(
          label: 'Email',
          type: FieldType.email,
          onSaved: (email) {
            bloc.add(InputEmail(email));
          },
        ),
        FaridTextField(
          label: 'Address',
          onSaved: (address) {
            bloc.add(InputAddress(address));
          },
        ),
     
      ],
    );
  }
}
