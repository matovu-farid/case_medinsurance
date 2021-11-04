import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPage extends Page {
  final Widget child;

  MyPage(this.child);
  @override
  Route createRoute(BuildContext context) {
    return (Platform.isIOS)
        ? CupertinoPageRoute(builder: (_) => child,settings: this)
        : MaterialPageRoute(builder: (_) => child,settings: this);
  }
}
