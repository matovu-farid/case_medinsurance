import 'package:bloc_test/bloc_test.dart';
import 'package:case_app/bloc/quotation/quotation_bloc.dart';
import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/classes/quotation_info.dart';
import 'package:case_app/data_handlers/savers/quotation_saver.dart';
import 'package:case_app/data_handlers/submitters/quotation_submitter.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';

import 'package:mockito/mockito.dart';
import 'quotation_bloc_test.mocks.dart';

@GenerateMocks([QuotationSubmitter, InputFormEvent, QuotationSaver])
main() {
  late QuotationBloc bloc;
  late MockQuotationSaver saver;
  late MockQuotationSubmitter submitter;
  late MockInputFormEvent event;
  late QuotationInfo quotationInfo;
  setUp(() {
    quotationInfo = CoorporateQuotationInfo();
    event = MockInputFormEvent();
    saver = MockQuotationSaver();
    submitter = MockQuotationSubmitter();
    bloc = QuotationBloc(saver, submitter);
    when(saver.fetchInfo()).thenReturn(CoorporateQuotationInfo());
        when(submitter.submit(any)).thenReturn(Right(() => ''));

  });
  blocTest<QuotationBloc, MyFormState>(
      'The input event should return the [QuotationInnitalState]',
      build: () => bloc,
      act: (bloc) => bloc.add(event),
      expect: () => [FormInitial()],
      verify: (bloc) {
        verify(saver.saveData(event)).called(1);
      });
  blocTest<QuotationBloc, MyFormState>(
      'The submit event should return the [Quotation sending,QuotationSent] states',
      build: () => bloc,
      act: (bloc) {
        bloc.add(SubmitForm());
      },
      expect: () => [FormSending(), FormSent()],
      verify: (bloc) {
        verify(bloc.saver.fetchInfo()).called(1);
      });
}
