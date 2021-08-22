import 'package:case_app/classes/aplication_info.dart/application_saver.dart';
import 'package:case_app/classes/aplication_info.dart/application_uploader.dart';
import 'package:case_app/widgets/date_textfield.dart';
import 'package:case_app/widgets/farid_dropdown.dart';
import 'package:case_app/widgets/farid_textfield.dart';
import 'package:flutter/material.dart';

class DependantDetails extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final PageController controller;

  DependantDetails(
    this.formKey,
    this.controller, {
    Key? key,
  }) : super(key: key);

  var store = DependantsStore.instance;

  Map<String, Widget> get row {
    var saver = DependantSaver();
    return {
      'Name': FaridTextField(
        fieldHeight: 45,
        type: FieldType.optional,
        onSaved: (name) {
          if (name != null) saver.name(name);
          saver.save(store);
        },
      ),
      'Gender': FaridDropDown(
        dropdownNames: ['Male', 'Female'],
        onSaved: (gender) {
          if (gender != null) saver.gender(gender);
          saver.save(store);
        },
      ),
      //TODO: handle date keeper
      'Date of Birth': FaridDateField(
        height: 45,
        onSaved: (date) {
          if (date != null) saver.dateOfBirth(date);
          saver.save(store);
        },
      ),
    };
  }

  List<Map<String, Widget>> get tableTextFields => [row, row, row, row, row];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                for (var i = 0; i < tableTextFields.length; i++)
                  TableRow(
                    children: [
                      Center(child: Text('${i + 1}.')),
                      tableTextFields[i]['Name']!,
                      tableTextFields[i]['Gender']!,
                      tableTextFields[i]['Date of Birth']!,
                    ],
                  ),
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
                      if (formKey.currentState!.validate()) {
                        formKey.currentState?.save();

                        ApplicationSender().send();
                      } else {
                        controller.previousPage(
                            duration: Duration(milliseconds: 100),
                            curve: Curves.easeOutQuad);
                      }
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