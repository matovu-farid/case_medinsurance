part of 'form_bloc.dart';

abstract class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object?> get props => [];
}
class ResetForm extends FormEvent{
  
}
abstract class InputFormEvent extends FormEvent {
  final String? text;
  @override
  List<Object?> get props => [text];

  InputFormEvent(this.text);
}

class SubmitForm extends FormEvent {
  @override
  List<Object?> get props => [];
}
