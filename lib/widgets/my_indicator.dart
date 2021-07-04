import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class MyIndicator extends StatelessWidget {
  final Indicator indicator;
   MyIndicator(this.indicator,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: LoadingIndicator(
            indicatorType: indicator,
          ),
    );
  }
}

