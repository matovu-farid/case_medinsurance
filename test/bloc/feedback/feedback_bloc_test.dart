import 'package:bloc_test/bloc_test.dart';
import 'package:case_app/bloc/feedback/feedback_bloc.dart';
import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/classes/feedback_info.dart';
import 'package:case_app/data_handlers/savers/feedback_saver.dart';
import 'package:case_app/data_handlers/submitters/feedback_submitter.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';

import 'package:mockito/mockito.dart';
import 'feedback_bloc_test.mocks.dart';

@GenerateMocks([FeedbackSubmitter, InputFormEvent, FeedbackSaver])
main() {
  late FeedbackBloc bloc;
  late MockFeedbackSaver saver;
  late MockFeedbackSubmitter submitter;
  late MockInputFormEvent event;
  late FeedbackInfo feedbackInfo;
  setUp(() {
    feedbackInfo = FeedbackInfo();
    event = MockInputFormEvent();
    saver = MockFeedbackSaver();
    submitter = MockFeedbackSubmitter();

    bloc = FeedbackBloc(saver, submitter);
    when(saver.fetchInfo()).thenReturn(FeedbackInfo());
    when(submitter.submit(any)).thenReturn(Right(() => ''));
  });
  blocTest<FeedbackBloc, MyFormState>(
      'The input event should return the [FeedbackInnitalState]',
      build: () => bloc,
      act: (bloc) => bloc.add(event),
      expect: () => [FormInitial()],
      verify: (bloc) {
        verify(saver.saveData(event)).called(1);
      });
  blocTest<FeedbackBloc, MyFormState>(
      'The submit event should return the [Feedback sending,FeedbackSent] states',
      build: () => bloc,
      act: (bloc) {
        bloc.add(SubmitForm());
      },
      expect: () => [FormSending(), FormSent()],
      verify: (bloc) {
        verify(bloc.saver.fetchInfo()).called(1);
      });
}
