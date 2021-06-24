import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DateTextField extends StatefulWidget {
  final String text;
  String hint;
  double height;
  DateTextField({Key key, this.text, this.hint,this.height}) : super(key: key);

  @override
  _DateTextFieldState createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
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
