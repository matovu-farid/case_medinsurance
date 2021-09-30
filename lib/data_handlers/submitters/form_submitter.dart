import 'dart:io';
import 'dart:typed_data';

import 'package:case_app/core/failure.dart';
import 'package:dartz/dartz.dart';

abstract class FormSubmitter<T> {
  Uint8List? attachment;
  Either<Failure, void> submit(T info,[File? file]);
}
