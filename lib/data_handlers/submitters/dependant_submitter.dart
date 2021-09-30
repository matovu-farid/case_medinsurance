import 'dart:io';
import 'dart:typed_data';

import 'package:case_app/bloc/application/application_bloc.dart';
import 'package:case_app/bloc/form_bloc/input_form_events.dart';
import 'package:case_app/classes/aplication_info.dart/application_info.dart';
import 'package:case_app/core/failure.dart';
import 'package:case_app/data_handlers/submitters/form_submitter.dart';
import 'package:dartz/dartz.dart';
import 'package:logging/logging.dart';

abstract class DependantSubmitter extends FormSubmitter<DependantInfo> {}

class DependantSubmitterImpl extends DependantSubmitter {
  final ApplicationBloc bloc;

  DependantSubmitterImpl(this.bloc);
static final _logger  = Logger('Dependant Logger');
  @override
  Either<Failure, void> submit(DependantInfo info, [File? file]) {
    try {
      if (info.isFilled) return Right(bloc.add(InputDependant(info)));
      return Right(()=>{});
    } on Exception catch (e) {
      return Left(DependantSubmitFailure()
        ..text = 'Failed to add dependant\n${e.toString()}');
    }
  }
}

class DependantSubmitFailure implements Failure {
  @override
  String text = '';
}
