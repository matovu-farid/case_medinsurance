import 'package:flutter/material.dart';

class FaridRadioTile extends StatefulWidget {
  final List<String> radioList;
  final String? label;
  final void Function(String?)? onChanged;
  final void Function() initCall;
  FaridRadioTile(
      {Key? key,
      required this.radioList,
      this.label,
      this.onChanged,
      required this.initCall})
      : super(key: key) {
    initCall();
  }

  @override
  _FaridRadioTileState createState() => _FaridRadioTileState();
}

class _FaridRadioTileState extends State<FaridRadioTile> {
  var groupValue = 0;

  RadioListTile radioTileBulder(String textGot, int value) {
    final RadioListTile tile = RadioListTile<int>(
      title: Text(textGot),
      onChanged: (value) {
        var onChanged = widget.onChanged;
        if (onChanged != null) onChanged(widget.radioList[value!]);
        setState(() {
          groupValue = value!;
        });
      },
      value: value,
      groupValue: groupValue,
    );

    return tile;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        if (widget.label != null) Text('${widget.label} : '),
        for (var i = 0; i < widget.radioList.length; i++)
          radioTileBulder(widget.radioList[i], i),
      ],
    );
  }
}
