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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClaimForm extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  late final bloc = getIt<ClaimBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClaimBloc, MyFormState>(
      builder: (context, state) {
          if (state is FormSending) return LoadingScreen();
        if (state is FormSendingFailure) return ErrorScreen(state.text,bloc);
        if (state is FormSent) return SuccessScreen(bloc);

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
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
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Claim Amount"),
                    onSaved: (amount) {
                      bloc.add(InputClaimAmount(amount));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: InputDecoration(hintText: "Banking Details"),
                      onSaved: (text) => bloc.add(InputBankingDetails(text))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Authorized Officer"),
                    onSaved: (text) => bloc.add(InputAuthorizingOfficer(text)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (text) => bloc.add(InputReason(text)),
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

                        bloc.add(SubmitForm());
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
