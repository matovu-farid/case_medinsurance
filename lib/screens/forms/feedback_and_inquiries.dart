import 'dart:io';

import 'package:case_app/bloc/feedback/feedback_bloc.dart';
import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/bloc/form_bloc/input_form_events.dart';
import 'package:case_app/core/service_locator.dart';
import 'package:case_app/data_handlers/submitters/form_submitter.dart';
import 'package:case_app/screens/products_and_services.dart';
import 'package:case_app/widgets/fields/farid_phone_field.dart';
import 'package:case_app/widgets/fields/farid_textfield.dart';
import 'package:case_app/widgets/fields/feedback_field.dart';
import 'package:case_app/widgets/submit_screens/error_screen.dart';
import 'package:case_app/widgets/submit_screens/loading_screen.dart';
import 'package:case_app/widgets/submit_screens/submit_success_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedbackInquiries extends StatelessWidget {
   final formKey = GlobalKey<FormState>();
late final bloc = getIt<FeedbackBloc>();
  
  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS)? CupertinoPageScaffold(
      
      navigationBar: CupertinoNavigationBar(middle: Text('Feedback & Inquiries'),),
      child: Scaffold(
        floatingActionButton: Submit(formKey: formKey, bloc: bloc),
        body: _Body(formKey)))
     : Scaffold(
       
       floatingActionButton: Submit(formKey: formKey, bloc: bloc),
     appBar: AppBar(centerTitle: true,title: Text('Feedback & Inquiries'),),

      body: _Body(formKey),
    );
  }
}

class Submit extends StatelessWidget {
  const Submit({
    Key? key,
    required this.formKey,
    required this.bloc,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final FeedbackBloc bloc;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
       onPressed: () {
                   var formState = formKey.currentState;
                   if (formState != null) {
                     formState.save();
                     bloc.add(SubmitForm());
                   }
                 },
                 backgroundColor: Colors.green,
                 label: Text(
                   'Submit',
                   style: TextStyle(color: Colors.white),
                 ),
    );
  }
}


class _Body extends StatefulWidget {
  final GlobalKey<FormState> formKey;

   _Body(this.formKey,{Key? key,  }) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  int? groupValue = 0;

  late final bloc = getIt<FeedbackBloc>();

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<FeedbackBloc, MyFormState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is FormLoading) return LoadingScreen();
          if (state is FormSendingFailure) return ErrorScreen(state.text, bloc);
          if (state is FormSent) return SuccessScreen(bloc);
          return  Form(
              key: widget.formKey,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    children: [
                      Flexible(child: Text('Are you a member?')),
                      Flexible(
                          child: RadioListTile(
                        value: 0,
                        groupValue: groupValue,
                        onChanged: (dynamic value) => setState(() {
                          groupValue = value;
                        }),
                        title: Text('Yes'),
                      )),
                      Flexible(
                          child: RadioListTile(
                        value: 1,
                        groupValue: groupValue,
                        onChanged: (dynamic value) =>
                            setState(() => groupValue = value),
                        title: Text('No'),
                      )),
                    ],
                  ),
                 if (groupValue == 0)
                        FaridTextField(
                          label: 'Card Number',
                          onSaved: (text) {
                            bloc.add(InputCardNumber(text));
                          },
                        ),
                      FaridTextField(
                        label: 'Company',
                        onSaved: (text) {
                          bloc.add(InputCompany(text));
                        },
                      ),
                      FaridPhoneField(
                        onSaved: (phoneNumber) {
                          bloc.add(InputPhoneNumber(phoneNumber?.number));
                        },
                      ),
                      FaridTextField(
                        label: 'Address',
                        onSaved: (text) {
                          bloc.add(InputAddress(text));
                        },
                      ),
                      FaridTextField(
                        label: 'Most visited provider',
                        onSaved: (text) {
                          bloc.add(InputMostVisitedProvider(text));
                        },
                      ),
                      FaridTextField(
                        label: 'Other provider visited',
                        onSaved: (text) {
                          bloc.add(InputOtherProviders(text));
                        },
                        type: FieldType.optional,
                      ),
                  FeedbackFeild(
                      onSaved: (text) {
                        bloc.add(InputComplaints(text));
                      },
                      label: 'Complaints'),
                  FeedbackFeild(
                      onSaved: (text) {
                        bloc.add(InputCompliments(text));
                      },
                      label: 'Compliments'),
                  FeedbackFeild(
                      onSaved: (text) {
                        bloc.add(InputInquiry(text));
                      },
                      label: 'Inquiry'),
                  SizedBox(
                    height:80
                  )
                 
                ],
              ),
            )
          ;
        },
      );
  }
}