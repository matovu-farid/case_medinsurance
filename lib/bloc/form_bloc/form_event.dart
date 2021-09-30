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
abstract class AttachDocument extends FormEvent{}
class AttachFromCamera extends AttachDocument {}
class AttachFromGallery extends AttachDocument {}
class SubmitForm extends FormEvent {
  @override
  List<Object?> get props => [];
}
