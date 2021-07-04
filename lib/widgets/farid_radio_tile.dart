import 'package:flutter/material.dart';

class FaridRadioTile extends StatefulWidget {
  final List<String> radioList;
  final String? label;
  const FaridRadioTile({Key? key, required this.radioList, this.label})
      : super(key: key);

  @override
  _FaridRadioTileState createState() => _FaridRadioTileState();
}

class _FaridRadioTileState extends State<FaridRadioTile> {
  var groupValue = 0;
  RadioListTile radioTileBulder(String textGot, int value) {
    final RadioListTile tile = RadioListTile(
      title: Text(textGot),
      onChanged: (value) {
        setState(() {
          groupValue = value;
        });
      },
      value: value,
      groupValue: groupValue,
    );

    return tile;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (widget.label != null) Text('${widget.label} : '),
        for (var i = 0; i < widget.radioList.length;i++)
        Flexible(child: radioTileBulder(widget.radioList[i], i)),
      ],
    );
  }
}
