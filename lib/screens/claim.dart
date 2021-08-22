import 'package:case_app/bloc/send_mail.dart';
import 'package:case_app/screens/auth_check.dart';
import 'package:case_app/widgets/date_textfield.dart';
import 'package:case_app/widgets/farid_phone_field.dart';
import 'package:case_app/widgets/mail.dart';
import 'package:flutter/material.dart';


class ClaimForm extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  var claim = Claim();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('Claim'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FaridPhoneField(onSaved: (number) {
        claim.phoneNumber = number!.completeNumber;
      },),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FaridDateField(
                hint: 'Treatment Date',
                onSaved: (date){
                  claim.treatmentDate = date;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Claim Amount"),
                onSaved: (amount) {
                  claim.claimAmount = amount;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: InputDecoration(hintText: "Banking Details"),
                  onSaved: (details) => claim.bankingDetails = details),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: "Authorized Officer"),
                onSaved: (officer) => claim.authorizedOfficer = officer,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onSaved: (reason) => claim.reason = reason,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: "Reason for claiming (if preauthorised)"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text("Upload claim documents"),
                onPressed: () {
                  var formstate = formKey.currentState!;
                  if (formstate.validate()) {
                    formstate.save();
                    
                    var mail = claim.mail();
                    AuthNavigator(context, MailWidget(mail: mail));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}



class Claim {
  String? phoneNumber;
  String? treatmentDate;
  String? claimAmount;
  String? bankingDetails;
  String? authorizedOfficer;
  String? reason;
  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'treatmentDate': treatmentDate,
      'claimAmount': claimAmount,
      'bankingDetails': bankingDetails,
      'authorizedOfficer': authorizedOfficer,
      'reason': reason
    };
  }

  mail() {
    return Mail(toJson(), 'sendClaim');
  }
}
