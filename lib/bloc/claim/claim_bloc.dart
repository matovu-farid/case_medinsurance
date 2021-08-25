import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/data_handlers/savers/claim_saver.dart';
import 'package:case_app/data_handlers/submitters/claim_submitter.dart';


class ClaimBloc extends FormBloc{
  ClaimBloc(ClaimSaver saver, ClaimSubmitter submitter) : super(saver, submitter);
}