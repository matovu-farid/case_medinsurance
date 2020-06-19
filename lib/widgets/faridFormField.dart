import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FaridFormField extends StatefulWidget {
  final String text;
  final Function onSaved;
  final FormFieldValidator validator;

  final bool isRadioBtton;
  final List<Map<String, int>> radioList;
  final bool isDropdown;
  final List<String> dropdownNames;
  final bool isCollapsed;
  final String hint;

  final Key key;
  static int index = 0;
  static int groupValue = 0;
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
     this.decoration,
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
    widget.textGot=FaridFormField.groupValue;
//    (FaridFormField.index != 0) ? FaridFormField.index++ : FaridFormField.index =0;
    final RadioListTile tile = RadioListTile(

      title: Text(textGot),
      onChanged: (value) {
        setState(() {
          FaridFormField.groupValue = value;
          widget.textGot=value;
        });
      },
      value: value,
      groupValue: FaridFormField.groupValue,
    );
    FaridFormField.index++;

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
