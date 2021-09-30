import 'package:flutter/material.dart';

class FaridDropDown extends StatefulWidget {
  final List<String> dropdownValues;
  final String? label;
  final bool isCollapsed;
  final String? hint;
  final void Function(String?)? onSaved;
  final InputDecoration? decoration;
  const FaridDropDown(
      {Key? key,
      required this.dropdownValues,
      this.label,
      this.isCollapsed = false,
      this.hint,
      this.onSaved, this.decoration})
      : super(key: key);

  @override
  _FaridDropDownState createState() => _FaridDropDownState();
}

class _FaridDropDownState extends State<FaridDropDown> {
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> dropItems = [
      ...widget.dropdownValues.map((name) => DropdownMenuItem<String>(
            value: name,
            child: Text(name),
          )),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
      child: DropdownButtonFormField<String>(
          decoration:(widget.decoration!=null)?widget.decoration:
              InputDecoration(labelText: widget.label, hintText: widget.hint),
          isDense: widget.isCollapsed,
          value: selectedItem,
          onSaved: widget.onSaved,
          onChanged: (value) {
            setState(() {
              selectedItem = value;
            });
          },
          items: dropItems),
    );
  }
}
