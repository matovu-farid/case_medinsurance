import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class FaridDateField extends StatefulWidget {
  final String? label;
  String? hint;
  double? height;
  InputDecoration? decoration;
  void Function(String?)? onSaved;
  FaridDateField({
    Key? key,
    this.label,
    this.hint,
    this.height,
    this.onSaved,
    this.decoration
  }) : super(key: key);

  @override
  _FaridDateFieldState createState() => _FaridDateFieldState();
}

class _FaridDateFieldState extends State<FaridDateField> {
  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      decoration:(widget.decoration!=null)? widget.decoration
          :InputDecoration(
          hintText: widget.hint,
          labelText: widget.label,
          border: OutlineInputBorder()),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      validator: (val) {
        if (val == null || val.isEmpty) return 'Enter a value';
        return null;
      },
      onSaved: widget.onSaved,
    );
  }
}
