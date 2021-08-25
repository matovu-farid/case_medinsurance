import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/data_handlers/savers/quotation_saver.dart';

import 'package:case_app/data_handlers/submitters/quotation_submitter.dart';

 class QuotationBloc extends FormBloc{
  QuotationBloc(QuotationSaver saver, QuotationSubmitter submitter) : super(saver, submitter);
}
class CooporateQuotationBloc extends QuotationBloc{
  CooporateQuotationBloc(
      CooperateQuotationSaverImpl saver, QuotationSubmitter submitter) : super(saver, submitter);
}
class IndividualQuotationBloc extends QuotationBloc{
  IndividualQuotationBloc(IndividualQuotationSaverImpl saver, QuotationSubmitter submitter) : super(saver, submitter);

}