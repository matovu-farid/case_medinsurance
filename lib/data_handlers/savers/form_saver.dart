import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:equatable/equatable.dart';

abstract class FormSaver<T> extends Equatable {
  void saveData(InputFormEvent event);
  void reset();

  T fetchInfo();
}
