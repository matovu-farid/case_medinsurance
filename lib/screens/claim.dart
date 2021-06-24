import 'package:case_app/widgets/date_textfield.dart';
import 'package:case_app/widgets/faridFormField.dart';
import 'package:flutter/material.dart';

class ClaimForm extends StatelessWidget {
  final formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Claim'),
      ),
      body: Form(
        key: formState,
        child: ListView(
          padding: EdgeInsets.only(top: 8,bottom: 8),

          shrinkWrap: true,
          children: [
            TextFormField(
              keyboardType: TextInputType.phone,
              validator: PhoneValidator("Enter a valid number"),
              decoration: InputDecoration(
                hintText: "Your number",
              ),
            ),
            DateTextField(
              hint: 'Treatment Date',
            )
            
          ],
        ),
      ),
    );
  }
}

class Claim {
  int phoneNumber;
  

}
