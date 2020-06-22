import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class FaridFormField extends StatefulWidget {
  final String text;
  final Function onSaved;
  final FormFieldValidator validator;
  Function disabled =()=>false;
  final bool isDate;

  final bool isRadioBtton;
  final List<Map<String, int>> radioList;
  final bool isDropdown;
  final List<String> dropdownNames;
  final bool isCollapsed;
  final String hint;

  final Key key;
   int index = 0;
   int groupValue = 0;
//   TextEditingController controller;
// static GlobalKey<FormFieldState> dropKey= GlobalKey<FormFieldState>();

  dynamic textGot ='';
  String selectedItem;
  final InputDecoration decoration;

  FaridFormField({
    this.text,
    this.validator,
    this.onSaved,
    this.isRadioBtton = false,
    this.radioList,
    this.isDropdown = false,
    this.dropdownNames = const ['farid'],
    this.isCollapsed = true,
    this.hint,
    this.key,
     this.decoration, this.isDate=false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FaridFormFieldState();
  }
}

class FaridFormFieldState extends State<FaridFormField> {
//  @override
//  void initState() {
//    super.initState();
//  }

//  @override
//  void dispose() {
//    widget.controller.dispose();
//    super.dispose();
//  }

  RadioListTile radioTileBulder(String textGot, int value) {
    widget.textGot=widget.groupValue;
//    (FaridFormField.index != 0) ? FaridFormField.index++ : FaridFormField.index =0;
    final RadioListTile tile = RadioListTile(

      title: Text(textGot),
      onChanged: (value) {
        setState(() {
          widget.groupValue = value;
          widget.textGot=value;
        });
      },
      value: value,
      groupValue: widget.groupValue,
    );
    widget.index++;

    return tile;
  }

  DropdownMenuItem<String> dropMenuItemBuilder(String dropdownName) {
    return DropdownMenuItem<String>(
        value: dropdownName, child: Text(dropdownName));
  }




  @override
  Widget build(BuildContext context) {
    if (widget.isDropdown) {

      List<DropdownMenuItem<String>> dropItems = [
        ...widget.dropdownNames.map((name) => DropdownMenuItem<String>(
              value: name,
              child: Text(name),
            )),
      ];
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Builder(builder: (context) {
            if (widget.text == null) {
              return Flexible(flex: 1, child: Text(''));
            }
            return Flexible(flex: 3, child: Text('${widget.text} : '));
          }),
          Builder(builder: (context) {
            if (widget.text == null) {
              return Flexible(
                flex: 7,
                child: DropdownButtonFormField<String>(
                  //key: FaridFormField.dropKey,
//                  onSaved: (value){
//                    widget.textGot=value;
//                  },
                    isDense: widget.isCollapsed,
                    value: widget.selectedItem,
                    onChanged: (value) {

                      setState(() {
                        widget.textGot=value;

                        widget.selectedItem = value;

                      });
                    },
                    items: dropItems ??
                        [
                          DropdownMenuItem(
                            child: Text('hello'),

                          )
                        ]),
              );
            }
            return Flexible(
              flex: 7,
              child: DropdownButton(
                  hint: Text(widget.hint),
                  value: widget.selectedItem,
                  onChanged: (value) {
                    setState(() {
                      widget.selectedItem = value;
                    });
                  },
                  items: dropItems ??
                      [
                        DropdownMenuItem(
                          child: Text('hello'),
                        )
                      ]),
            );
          }),
        ],
      );
    }
    if (widget.isRadioBtton) {
      return Row(
        children: <Widget>[
          if (widget.text != null) Text('${widget.text} : '),
          ...widget.radioList.map((map) => Flexible(
              flex: widget.radioList.length,
              child: radioTileBulder(map.keys.first, map[map.keys.first]))),
        ],
      );
    }
    if(widget.isDate)
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,


        children: [
          Flexible(
            flex: 3,
              child: Text("${widget.text??''}")),
//          SizedBox(
//            height: 10,
//            width: 50,
//          ),

          Flexible(
            flex: 7,
            child: TextFormField(

              //focusNode: FocusNode(canRequestFocus: false),
              readOnly: true,

              decoration: InputDecoration(hintText:(widget.textGot=='')?'Tap Here':widget.textGot ,
              helperStyle: TextStyle(color: Colors.black,inherit: false),),
              onTap: () {
                DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    minTime: DateTime(1930, 1, 1),
                    maxTime: DateTime(2050, 1, 1),
                    theme: DatePickerTheme(
                        headerColor: Colors.orange,
                        backgroundColor: Colors.green,
                        itemStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                        doneStyle: TextStyle(color: Colors.white, fontSize: 16)),
                onChanged: (date) {

              setState(() {
                widget.textGot='${date.day}/${date.month}/${date.year}';
              });},
//
                    currentTime: DateTime.now(),
                    locale: LocaleType.en);
              },

            ),
          ),
        ],
      );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        if(widget.text!=null)
        Flexible(
          flex: 3,
          child: Text('${widget.text} : '),
        ),
        Flexible(
          flex: 7,
          child: TextFormField(
//            textInputAction: TextInputAction.,
//            keyboardType: TextInputType.multiline,
            onSaved: (value) {},

            onChanged: (value) {
              widget.textGot=value;
            },
            validator: widget.validator == null
                ? (value) {
                    return value.isEmpty ? 'Fill in the ${widget.text}' : null;
                  }
                : widget.validator,

            decoration: widget.decoration ?? InputDecoration(
                isDense: true,
                isCollapsed: widget.isCollapsed,
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.black),
                )),
          ),
        )
      ],
    );

  }
}
