import 'dart:async';

import 'package:case_app/bloc/send_mail.dart';
import 'package:case_app/widgets/my_indicator.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class MailWidget extends StatelessWidget {
  final Mail mail;
  const MailWidget({Key? key,required this.mail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: mail.send(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            if(snapshot.hasData) return Text(snapshot.error as String);
            Timer(Duration(seconds: 2), (){
              Navigator.of(context).pop();
            });
            return Container(
            child: Text('Success'),
          );
          }
           return MyIndicator(Indicator.ballRotate);
        
        }
       
      ),
    );
  }
}
