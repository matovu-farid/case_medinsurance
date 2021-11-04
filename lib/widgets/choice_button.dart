import 'package:case_app/core/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:responsive_grid/responsive_grid.dart';

class ChoiceButton extends StatelessWidget {
  final String name;
  final void Function() onPressed;

  const ChoiceButton({Key? key, required this.name, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final fontSize = SizeConfig(context).blockWidth*3.5;
    return Padding(
    padding:  EdgeInsets.only(top: 0, bottom: fontSize, left: 0, right: 0),
      child: MaterialButton(
        onPressed: onPressed,
        splashColor: Colors.amber,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Theme.of(context).primaryColor),
          child: Center(
              child: Padding(
            padding:  EdgeInsets.all(fontSize*1.5),
            child: Text(
              name,
              
              maxLines: 2,
              style: TextStyle(color: Colors.white, fontSize: fontSize
              ),
            ),
          )),
        ),
      ),
    );
  }
}
