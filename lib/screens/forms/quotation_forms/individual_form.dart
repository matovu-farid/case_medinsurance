import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/bloc/form_bloc/input_form_events.dart';
import 'package:case_app/bloc/quotation/quotation_bloc.dart';
import 'package:case_app/core/service_locator.dart';
import 'package:case_app/widgets/fields/farid_dropdown.dart';
import 'package:case_app/widgets/fields/farid_phone_field.dart';
import 'package:case_app/widgets/fields/farid_textfield.dart';
import 'package:case_app/widgets/submit_screens/error_screen.dart';
import 'package:case_app/widgets/submit_screens/loading_screen.dart';
import 'package:case_app/widgets/submit_screens/submit_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndividualForm extends StatelessWidget {
  IndividualForm({
    Key? key,
  }) : super(key: key);
  late final bloc = getIt<IndividualQuotationBloc>();
  List<Widget> get individualList => <Widget>[
        FaridTextField(
          label: 'Name',
          onSaved: (text) {
            bloc.add(InputName(text));
          },
        ),
        FaridPhoneField(
          onSaved: (number) {
            bloc.add(InputPhoneNumber(number?.completeNumber));
          },
        ),
        FaridTextField(
          label: 'Email',
          type: FieldType.email,
          onSaved: (text) {
            bloc.add(InputEmail(text));
          },
        ),
        FaridTextField(
          label: 'Age Bracket',
          onSaved: (text) {
            bloc.add(InputAgeBracket(text));
          },
        ),
        FaridDropDown(
          label: 'Cover Type',
          hint: 'Select Cover type',
          onSaved: (text) {
            bloc.add(InputCoverType(text));
          },
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
    return BlocBuilder<IndividualQuotationBloc, MyFormState>(
      builder: (context, state) {
          if (state is FormSending) return LoadingWidget();
        if (state is FormSendingFailure) return ErrorsWidget(state.text,bloc);
        if (state is FormSent) return SuccessWidget(bloc);
        return Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Center(
                child: Text(
                  'Individual Request:',
                  style: TextStyle(
                      color: Colors.green,
                      decorationThickness: 5,
                      fontSize: 18),
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
                  var formState = _formKey.currentState;
                  if (formState != null && formState.validate()) {
                    formState.save();
                    bloc.add(SubmitForm());
                  }
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
      },
    );
  }
}
