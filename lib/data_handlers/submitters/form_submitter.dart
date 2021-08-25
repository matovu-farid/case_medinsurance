import 'package:case_app/core/failure.dart';
import 'package:dartz/dartz.dart';

abstract class FormSubmitter<T> {
  Either<Failure,void> submit(T info);
}
