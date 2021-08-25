
import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/data_handlers/savers/feedback_saver.dart';
import 'package:case_app/data_handlers/submitters/feedback_submitter.dart';

class FeedbackBloc extends FormBloc{
  FeedbackBloc(FeedbackSaver saver, FeedbackSubmitter submitter) : super(saver, submitter);

}