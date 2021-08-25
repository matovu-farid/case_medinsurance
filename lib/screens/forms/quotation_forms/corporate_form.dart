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
import 'package:flutter_bloc/flutter_bloc.dart';

class CorporateForm extends StatelessWidget {
  CorporateForm({
    Key? key,
  }) : super(key: key);
  late final bloc = getIt<CooporateQuotationBloc>();
  List<Widget> get corporateList => <Widget>[
        FaridTextField(
          label: 'Company',
          onSaved: (text) {
            bloc.add(InputName(text));
          },
        ),
        FaridTextField(
          label: 'No. of lives',
          onSaved: (text) {
            bloc.add(InputNoOfLives(text));
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
          label: 'Address',
          onSaved: (text) {
            bloc.add(InputAddress(text));
          },
        ),
        FaridPhoneField(
          onSaved: (number) {
            bloc.add(InputPhoneNumber(number?.completeNumber));
          },
        ),
        FaridDropDown(
          label: 'Type of Business',
          hint: 'Select Type of business',
          onSaved: (text) {
            bloc.add(InputTypeOfBusiness(text));
          },
          dropdownNames: [
            'NGO',
            'Government Body',
            'School',
            'Manufacturing',
            'Religious institution',
            'Financial institution',
            'Sacco',
            'Other '
          ],
        ),
      ];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CooporateQuotationBloc, MyFormState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is FormSending) return LoadingWidget();
        if (state is FormSendingFailure) return ErrorsWidget(state.text, bloc);
        if (state is FormSent) return SuccessWidget(bloc);
        return Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Center(
                child: Text(
                  'Corporate/Group Request:',
                  style: TextStyle(
                      color: Colors.green,
                      decorationThickness: 5,
                      fontSize: 18),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  //                                 itemCount: corporateList.length,
                  itemCount: corporateList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: corporateList[index],
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
