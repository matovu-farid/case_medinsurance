import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/core/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'package:case_app/bloc/application/application_bloc.dart';

import 'package:case_app/data_handlers/savers/application_saver.dart';
import 'package:case_app/screens/forms/aplication_form_pages/widgets/dependant_table_row.dart';

class DependantDetails extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final PageController controller;

  DependantDetails(
    this.formKey,
    this.controller, {
    Key? key,
  }) : super(key: key);

  static final _logger = Logger('Dependants');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Center(
              child: Text('Dependants Details(Optional)'),
            ),
            Table(
              columnWidths: {0: FixedColumnWidth(20)},
              border: TableBorder.all(color: Colors.black),
              children: [
                TableRow(
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                    ),
                    Center(child: Text('Name')),
                    Center(child: Text('Gender')),
                    Center(child: Text('Date of Birth')),
                  ],
                ),
                for (var i = 0; i < 3; i++) DependantTableRow(i)
              ],
            ),
            ButtonBar(
              children: [
                OutlinedButton(
                    onPressed: () {
                      controller.previousPage(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeOutBack);
                    },
                    child: Text('Back')),
                OutlinedButton(
                    onPressed: () {
                      var formState = formKey.currentState;
                      ApplicationBloc bloc = getIt<ApplicationBloc>();
                      
                      formState?.save();
                      // if (formState != null && formState.validate()) {
                      //   // formState.save();
                      //   // submitSavers();
                      bloc.add(SubmitForm());

                      // }
                    },
                    child: Text('Submit')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
