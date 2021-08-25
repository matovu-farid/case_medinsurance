import 'package:case_app/bloc/application/dependant_bloc.dart';
import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/bloc/form_bloc/input_form_events.dart';
import 'package:case_app/core/service_locator.dart';
import 'package:case_app/data_handlers/savers/dependant_saver.dart';
import 'package:case_app/data_handlers/submitters/dependant_submitter.dart';
import 'package:case_app/widgets/fields/date_textfield.dart';
import 'package:case_app/widgets/fields/farid_dropdown.dart';
import 'package:case_app/widgets/fields/farid_textfield.dart';
import 'package:flutter/cupertino.dart';

class DependantTableRow extends TableRow {
  final int index;
  late final saver = getIt<DependantSaver>();
  late final submitter = getIt<DependantSubmitter>();

  DependantTableRow(this.index);
  @override
  List<Widget>? get children => [
        Center(
          child: Text('${index + 1}'),
        ),
        FaridTextField(
          fieldHeight: 45,
          type: FieldType.optional,
          onSaved: (text) {
            saver.saveData(InputName(text));
          
          },
        ),
        FaridDropDown(
          dropdownNames: ['Male', 'Female'],
          onSaved: (text) {
           saver.saveData(InputGender(text));
          },
        ),
        FaridDateField(
          height: 45,
          onSaved: (text) {
             saver.saveData(InputDateOfBirth(text));
               submitter.submit(saver.fetchInfo());
          },
        ),
      ];
}
