part of 'form_bloc.dart';

abstract class MyFormState extends Equatable {
  const MyFormState();

  @override
  List<Object> get props => [];
}

class FormInitial extends MyFormState {}

class FormSendingFailure extends MyFormState {
  String text;
  FormSendingFailure(this.text);
}

class FormSent extends MyFormState {}

class FormLoading extends MyFormState {}
