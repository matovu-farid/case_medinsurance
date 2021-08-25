import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:case_app/bloc/form_bloc/form_bloc.dart';

class SuccessScreen extends StatelessWidget {
  final FormBloc bloc;
  const SuccessScreen(
    this.bloc, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SuccessWidget(bloc),
    );
  }
}

class SuccessWidget extends StatelessWidget {
  final FormBloc bloc;
  const SuccessWidget(
    this.bloc, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Success'),
                trailing: Icon(
                  Icons.done_outline_outlined,
                  color: Colors.green,
                ),
                subtitle:
                    Text('''Thank you, we have recieved your information.'''),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  onPressed: () {
                    bloc.add(ResetForm());

                    Navigator.of(context).pop();
                  },
                  child: Text('Exit'))
            ],
          ),
        ),
      ),
    );
  }
}
