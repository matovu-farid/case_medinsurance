import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChoiceButton extends StatelessWidget {
  final String name;
  final void Function() onPressed;

  const ChoiceButton({Key? key, required this.name, required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 0, right: 0),
      child: MaterialButton(
        onPressed: onPressed,
        splashColor: Colors.amber,
        hoverColor: Colors.red[200],
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Theme.of(context).primaryColor),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              maxLines: 2,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )),
        ),
      ),
    );
  }
}
