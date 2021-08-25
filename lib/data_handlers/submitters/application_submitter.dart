import 'package:case_app/classes/aplication_info.dart/application_info.dart';
import 'package:case_app/core/failure.dart';
import 'package:case_app/data_handlers/submitters/form_submitter.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_helpers/firebase_helpers.dart';

abstract class ApplicationSubmitter extends FormSubmitter<ApplicationInfo> {}

class ApplicationSubmitterImpl extends ApplicationSubmitter with FirebaseMixin {
  @override
  Either<Failure, void> submit(ApplicationInfo info) {
    try {
      return Right(call('sendApplicationWithDependants', info.toJson()));
    } on Exception catch (e) {

      return Left(ApplicationSubmitFailure()
      ..text = 'Failed to submit your application.\n${e.toString()}');
    }
  }
}

class ApplicationSubmitFailure implements Failure {
  @override
  String text = '';
}
