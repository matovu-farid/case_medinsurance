import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:case_app/classes/quotation_info.dart';
import 'package:case_app/core/failure.dart';
import 'package:case_app/data_handlers/submitters/form_submitter.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_helpers/firebase_helpers.dart';
import 'package:logging/logging.dart';

abstract class QuotationSubmitter extends FormSubmitter<QuotationInfo> {}

class QuotationSubmitterImpl extends QuotationSubmitter with FirebaseMixin {
  static final _logger = Logger('Quotation Submitter');
  @override
  Either<Failure, void> submit(QuotationInfo info, [File? file]) {
    try {
      if (info is IndividualQuotationInfo) {
        _logger.warning('individual quotaion sent of\n ${info.toJson}');
        return Right(call('sendIndividualQuotation', info.toJson));
      } else {
         _logger.warning('cooporate quotaion sent of\n $info');
        return Right( call('sendCorporateQuotation', info.toJson));
      }
    } catch (e) {
      return Left(QuotationSubmitFailure()
        ..text = 'Failed sending the quotation\n${e.toString()}');
    }
  }
}

class QuotationSubmitFailure implements Failure {
  @override
  String text = '';
}
