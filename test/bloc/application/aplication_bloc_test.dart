import 'package:bloc_test/bloc_test.dart';
import 'package:case_app/bloc/application/application_bloc.dart';
import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/classes/aplication_info.dart/application_info.dart';
import 'package:case_app/data_handlers/savers/application_saver.dart';
import 'package:case_app/data_handlers/submitters/application_submitter.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';

import 'package:mockito/mockito.dart';
import 'aplication_bloc_test.mocks.dart';

@GenerateMocks([
  ApplicationSubmitter,
  InputFormEvent,
  ApplicationSaver,
  ClientData,
  DependantInfo
])
main() {
  late ApplicationBloc bloc;
  late MockApplicationSaver saver;
  late MockApplicationSubmitter submitter;
  late MockInputFormEvent event;
  late ApplicationInfo applicationInfo;
  setUp(() {
    applicationInfo = ApplicationInfo(
      [MockDependantInfo()],
      MockClientData(),
    );
    event = MockInputFormEvent();
    saver = MockApplicationSaver();
    submitter = MockApplicationSubmitter();
    bloc = ApplicationBloc(saver, submitter);
    when(saver.fetchInfo()).thenReturn(applicationInfo);
    when(submitter.submit(applicationInfo)).thenReturn(Right(()=>''));
  });
  blocTest<ApplicationBloc, MyFormState>(
      'The input event should return the [ApplicationInnitalState]',
      build: () => bloc,
      act: (bloc) => bloc.add(event),
      expect: () => [FormInitial()],
      verify: (bloc) {
        verify(saver.saveData(event)).called(1);
      });
  blocTest<ApplicationBloc, MyFormState>(
      'The submit event should return the [Application sending,ApplicationSent] states',
      build: () => bloc,
      act: (bloc) {
        bloc.add(SubmitForm());
      },
      expect: () => [FormSending(), FormSent()],
      verify: (bloc) {
        verify(bloc.saver.fetchInfo()).called(1);
      });
}
