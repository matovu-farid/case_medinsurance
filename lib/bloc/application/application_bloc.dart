import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/data_handlers/savers/application_saver.dart';
import 'package:case_app/data_handlers/submitters/application_submitter.dart';

class ApplicationBloc extends FormBloc{
  ApplicationBloc(ApplicationSaver saver, ApplicationSubmitter submitter) : super(saver, submitter);
}