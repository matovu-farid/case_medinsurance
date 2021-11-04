import 'package:flutter/material.dart';

class SizeConfig {
  final BuildContext context;
  late double blockWidth;
  late double blockHeight;

  SizeConfig(this.context) {
    var size = MediaQuery.of(context).size;
    this.blockWidth = size.width / 100;
    this.blockHeight = size.height / 100;
  }
}
