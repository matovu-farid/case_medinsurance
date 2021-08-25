import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/data_handlers/savers/dependant_saver.dart';
import 'package:case_app/data_handlers/submitters/dependant_submitter.dart';


class DependantBloc extends FormBloc{
  DependantBloc(DependantSaver saver, DependantSubmitter submitter) : super(saver, submitter);
}