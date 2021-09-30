import 'package:bloc_test/bloc_test.dart';
import 'package:case_app/bloc/application/dependant_bloc.dart';
import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/classes/aplication_info.dart/application_info.dart';
import 'package:case_app/data_handlers/savers/dependant_saver.dart';
import 'package:case_app/data_handlers/submitters/dependant_submitter.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';

import 'package:mockito/mockito.dart';
import 'dependant_bloc_test.mocks.dart';

@GenerateMocks([DependantSubmitter, InputFormEvent, DependantSaver])
main() {
  late DependantBloc bloc;
  late MockDependantSaver saver;
  late MockDependantSubmitter submitter;
  late MockInputFormEvent event;
  late DependantInfo dependantInfo;
  setUp(() {
    dependantInfo = DependantInfo();
    event = MockInputFormEvent();
    saver = MockDependantSaver();
    submitter = MockDependantSubmitter();
    bloc = DependantBloc(saver, submitter);
    when(saver.fetchInfo()).thenReturn(DependantInfo());
    when(submitter.submit(dependantInfo)).thenReturn(Right(() => ''));

  });
  blocTest<DependantBloc, MyFormState>(
      'The input event should return the [DependantInnitalState]',
      build: () => bloc,
      act: (bloc) => bloc.add(event),
      expect: () => [FormInitial()],
      verify: (bloc) {
        verify(saver.saveData(event)).called(1);
      });
  blocTest<DependantBloc, MyFormState>(
      'The submit event should return the [Dependant sending,DependantSent] states',
      build: () => bloc,
      act: (bloc) {
        bloc.add(SubmitForm());
      },
      expect: () => [FormLoading(), FormSent()],
      verify: (bloc) {
        verify(bloc.saver.fetchInfo()).called(1);
      });
}
