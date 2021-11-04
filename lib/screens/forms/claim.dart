import 'dart:io';

import 'package:case_app/bloc/claim/claim_bloc.dart';
import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/bloc/form_bloc/input_form_events.dart';
import 'package:case_app/bloc/send_mail.dart';
import 'package:case_app/classes/claim_info.dart';
import 'package:case_app/core/service_locator.dart';
import 'package:case_app/screens/auth_check.dart';
import 'package:case_app/widgets/fields/date_textfield.dart';
import 'package:case_app/widgets/fields/farid_phone_field.dart';
import 'package:case_app/widgets/mail.dart';
import 'package:case_app/widgets/submit_screens/error_screen.dart';
import 'package:case_app/widgets/submit_screens/loading_screen.dart';
import 'package:case_app/widgets/submit_screens/submit_success_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClaimForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS)
      return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Claim'),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 93),
            child: _Body(),
          ));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Claim'),
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  _Body({Key? key}) : super(key: key);

  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  final formKey = GlobalKey<FormState>();

  late final bloc = getIt<ClaimBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClaimBloc, MyFormState>(
      builder: (context, state) {
        if (state is FormLoading) return LoadingScreen();
        if (state is FormSendingFailure) return ErrorScreen(state.text, bloc);
        if (state is FormSent) return SuccessScreen(bloc);

        return Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:  DynamicTextFormField(
                        hint: "Name",
                        onSaved: (text) => bloc.add(InputName(text))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FaridPhoneField(
                  onSaved: (number) {
                    bloc.add(InputPhoneNumber(number?.completeNumber));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FaridDateField(
                  label: 'Treatment Date',
                  hint: 'Treatment Date',
                  onSaved: (date) {
                    bloc.add(InputDateOfBirth(date));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DynamicTextFormField(
                  keyboardType: TextInputType.number,
                  hint: "Claim Amount",
                  onSaved: (amount) {
                    bloc.add(InputClaimAmount(amount));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DynamicTextFormField(
                    hint: "Banking Details",
                    onSaved: (text) => bloc.add(InputBankingDetails(text))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DynamicTextFormField(
                  hint: "Authorized Officer",
                  onSaved: (text) => bloc.add(InputAuthorizingOfficer(text)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DynamicTextFormField(
                  onSaved: (text) => bloc.add(InputReason(text)),
                  hint: "Reason for claiming (if preauthorised)",
                  keyboardType: TextInputType.multiline,
                  
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(

                  color: Colors.green,
                  child: Text("Attach claim documents",style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    var formstate = formKey.currentState!;
                    if (formstate.validate()) {
                      formstate.save();

                      addAttachment(context);
                    }
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void addAttachment(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Attachment'),
            content: Text('Add document'),
            actions: [
              TextButton(
                  onPressed: () {
                    bloc.add(AttachFromCamera());
                    Navigator.of(context).pop();
                  },
                  child: Text('Camera')),
              TextButton(
                  onPressed: () {
                    bloc.add(AttachFromGallery());
                    Navigator.of(context).pop();
                  },
                  child: Text('Gallery')),
            ],
          );
        });
  }
}

class DynamicTextFormField extends StatelessWidget {
  final Function(String?) onSaved;
  String hint;
  TextInputType? keyboardType;

   DynamicTextFormField(
      { required this.onSaved, required this.hint,this.keyboardType})
      ;

  @override
  Widget build(BuildContext context) {
    return 
        TextFormField(
          keyboardType: keyboardType,
            decoration: InputDecoration(hintText: hint),
            onSaved: onSaved,
          );
  }
}
