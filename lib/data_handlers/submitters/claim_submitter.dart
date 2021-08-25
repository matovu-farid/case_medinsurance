import 'package:case_app/classes/claim_info.dart';
import 'package:case_app/core/failure.dart';
import 'package:case_app/data_handlers/submitters/form_submitter.dart';
import 'package:case_app/screens/forms/claim.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_helpers/firebase_helpers.dart';

abstract class ClaimSubmitter extends FormSubmitter<ClaimInfo> {}

class ClaimSubmitterImpl extends ClaimSubmitter with FirebaseMixin {
  @override
  Either<Failure, void> submit(ClaimInfo info) {
    try {
      return Right(call('sendClaim', info.toJson()));
    } on Exception catch (e) {
      return Left(SubmitClaimFailure()
        ..text = 'Failed to submit the claim form.\n${e.toString()}');
    }
  }
}

class SubmitClaimFailure implements Failure {
  @override
  String text = '';
}
