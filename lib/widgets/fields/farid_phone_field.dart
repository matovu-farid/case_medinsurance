import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class FaridPhoneField extends StatelessWidget {
  const FaridPhoneField({
    Key? key,
     this.onSaved,
  }) : super(key: key);

  final Function(PhoneNumber?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      autoValidate: false,
      onSaved: onSaved,
      validator: (value) {
        var regex = RegExp(r'\d{9}');

        if (!regex.hasMatch(value!)) return 'Invalid phone number';
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Your Number',
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      initialCountryCode: 'UG',
    );
  }
}