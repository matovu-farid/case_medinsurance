import 'dart:io';
import 'dart:typed_data';

import 'package:case_app/classes/claim_info.dart';
import 'package:case_app/core/failure.dart';
import 'package:case_app/core/firestore.dart';
import 'package:case_app/data_handlers/submitters/form_submitter.dart';
import 'package:case_app/screens/forms/claim.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_helpers/firebase_helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:random_string/random_string.dart';
import 'package:path/path.dart' as path;

abstract class ClaimSubmitter extends FormSubmitter<ClaimInfo> {}

class ClaimSubmitterImpl extends ClaimSubmitter
    with FirebaseMixin, FirestoreAbbreviations {
  late String fileName;
  late String url;

  Future _saveAttachment(File file) async {
    fileName = path.basename(file.path);
    var ref= FirebaseStorage.instanceFor(bucket: 'gs://caseapp-8a255').ref(fileName);

    await ref.putFile(file);
    url = await ref.getDownloadURL();
  }

 

  @override
  Either<Failure, void> submit(ClaimInfo info, [File? file]) {
    try {
      if (file == null) throw NullAttachment();
      return Right(_saveAttachment(file).whenComplete(() {
        return call(
            'sendClaim', {...info.toJson(), 'fileName': fileName, 'url': url});
      }));
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

class NullAttachment implements Exception {
  @override
  String toString() {
    return 'Attachment is null';
  }
}
