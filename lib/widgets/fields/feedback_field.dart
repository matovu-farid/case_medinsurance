import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedbackFeild extends StatelessWidget {
  final void Function(String? text) onSaved;
  final String label;

  const FeedbackFeild({Key? key, required this.onSaved, required this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelStyle: TextStyle(color: Colors.green),
            labelText: '$label:'),
        onSaved: onSaved,
      ),
    );
  }
}
