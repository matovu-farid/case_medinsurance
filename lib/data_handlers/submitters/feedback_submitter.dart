import 'package:case_app/classes/feedback_info.dart';
import 'package:case_app/core/failure.dart';
import 'package:case_app/data_handlers/submitters/form_submitter.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_helpers/firebase_helpers.dart';

abstract class FeedbackSubmitter extends FormSubmitter<FeedbackInfo> {}

class FeedbackSubmitterImpl extends FeedbackSubmitter with FirebaseMixin {
  @override
  Either<Failure, void> submit(FeedbackInfo info) {
    try {
      return Right(call('sendFeedback', info.toJson()));
    } catch (e) {
      return Left(FeedbackFailure()..text='Failed to send feed back\n${e.toString()}');
    }
  }
}

class FeedbackFailure implements Failure {
  @override
  String text = '';
}
