import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:case_app/data_handlers/savers/form_saver.dart';
import 'package:case_app/data_handlers/submitters/form_submitter.dart';
import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, MyFormState> {
  FormBloc(
    this.saver,
    this.submitter,
  ) : super(FormInitial());
  final FormSaver saver;
  final FormSubmitter submitter;

  @override
  Stream<MyFormState> mapEventToState(
    FormEvent event,
  ) async* {
    if (event is ResetForm) {
      saver.reset();
      yield FormInitial();
    } else if (event is InputFormEvent) {
      yield _mapInputEvent(event);
    } else {
      if (event is SubmitForm) {
        yield FormSending();

        yield await _mapSubmitEvent(event);
      }
    }
  }

  sendForm() {}

  MyFormState _mapInputEvent(InputFormEvent event) {
    saver.saveData(event);
    return FormInitial();
  }

  static final _logger = Logger('Form Bloc');

  Future<MyFormState> _mapSubmitEvent(SubmitForm event) async {
    var formInfo = saver.fetchInfo();
    _logger.warning(formInfo);
    
    return submitter
        .submit(formInfo)
        .fold((l) => FormSendingFailure(l.text), (r) => FormSent());
  }
}
