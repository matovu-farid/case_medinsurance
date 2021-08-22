import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

enum FieldType { optional, email, dafault }

class FaridTextField extends StatelessWidget {
  final String? label;
  final double fieldHeight;
  final FieldType type;
  final InputDecoration? decoration;
  final bool isCollapsed;
  final void Function(String?)? onSaved;
  const FaridTextField(
      {Key? key,
      this.label,
      this.fieldHeight = 25,
      this.type = FieldType.dafault,
      this.decoration,
      this.isCollapsed = true, this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (label != null)
            Flexible(
              flex: 3,
              child: Text('$label '),
            ),
          Flexible(
            flex: 7,
            child: TextFormField(
              //expands: true,
              //maxLines: null,
              //minLines: null,
              onSaved: onSaved,
              onChanged: (value) {},
              validator: (value) {
                switch (type) {
                  case FieldType.email:
                    return MultiValidator(<FieldValidator>[
                      EmailValidator(errorText: 'Enter a valid email'),
                      RequiredValidator(errorText: 'This field is required')
                    ]).call(value);

                  case FieldType.dafault:
                    return RequiredValidator(
                            errorText: 'This field is required')
                        .call(value);

                  default:
                    return null;
                }
              },
              decoration: decoration ??
                  InputDecoration(
                      // isDense: true,
                      //isCollapsed: isCollapsed,
                      border: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.black),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
