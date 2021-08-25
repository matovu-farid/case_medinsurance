import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final FormBloc bloc;
  final String text;

  const ErrorScreen(this.text, this.bloc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorsWidget(text,bloc),
    );
  }
}

class ErrorsWidget extends StatelessWidget {
  const ErrorsWidget(
    this.text,this.bloc,);
  final FormBloc bloc;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Failure'),
                trailing: Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                subtitle: Text('''Sorry, we got an issue.
                    \n The following error was got : ${text}
                    '''),
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
