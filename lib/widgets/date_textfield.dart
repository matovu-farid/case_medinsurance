import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class FaridDateField extends StatefulWidget {
  /// stores the date statically
  final DateKeeper dateKeeper = DateKeeper();
  final String? text;
  String? hint;
  double? height;
  void Function(String?)? onSaved;
  FaridDateField({
    Key? key,
    this.text,
    this.hint,
    this.height,
    this.onSaved,
  }) : super(key: key);

  @override
  _FaridDateFieldState createState() => _FaridDateFieldState();
}

class _FaridDateFieldState extends State<FaridDateField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (widget.text != null)
          Flexible(flex: 3, child: Text("${widget.text}")),
        Flexible(
          flex: 7,
          child: Container(
            height: widget.height ?? 60,
            child: TextFormField(
              onSaved: (_) {
                var onSaved = widget.onSaved;
                if(onSaved!=null)
                onSaved(widget.dateKeeper.date);
              },

              expands: true,
              minLines: null,
              maxLines: null,
              //focusNode: FocusNode(canRequestFocus: false),
              readOnly: true,

              decoration: InputDecoration(
                border: OutlineInputBorder(),
                isCollapsed: true,
                hintText: widget.hint ?? '',
                helperStyle: TextStyle(color: Colors.black, inherit: false),
              ),
              onTap: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(1930, 1, 1),
                    maxTime: DateTime(2050, 1, 1),
                    theme: DatePickerTheme(
                        headerColor: Colors.orange,
                        backgroundColor: Colors.green,
                        itemStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        doneStyle:
                            TextStyle(color: Colors.white, fontSize: 16)),
                    onChanged: (date) {
                  setState(() {
                    widget.hint = '${date.day}/${date.month}/${date.year}';
                    widget.dateKeeper
                        .setDate('${date.day}/${date.month}/${date.year}');
                  });
                },
//
                    currentTime: DateTime.now(),
                    locale: LocaleType.en);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class DateKeeper {
  String date = '';
  setDate(String dateGot) {
    date = dateGot;
  }
}
