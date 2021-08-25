import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/bloc/form_bloc/input_form_events.dart';
import 'package:case_app/classes/quotation_info.dart';

import 'form_saver.dart';

abstract class QuotationSaver extends FormSaver<QuotationInfo> {}

class CooperateQuotationSaverImpl extends QuotationSaver {
  var _quotation = CoorporateQuotationInfo();
  @override
  QuotationInfo fetchInfo() => _quotation;

  @override
  void saveData(InputFormEvent event) {
    if (event is InputName) {
      _quotation.name = event.text;
      return;
    } else if (event is InputEmail) {
      _quotation.email = event.text;
      return;
    } else if (event is InputPhoneNumber) {
      _quotation.phoneNumber = event.text;
      return;
    } else if (event is InputNoOfLives) {
      _quotation.noOfLives = event.text;
      return;
    } else if (event is InputNoOfLives) {
      _quotation.noOfLives = event.text;
      return;
    }else if (event is InputTypeOfBusiness) {
      _quotation.typeOfBusiness = event.text;
      return;
    }
  }

  @override
  List<Object?> get props => [_quotation];

  @override
  void reset() {
    _quotation = CoorporateQuotationInfo();
  }
}

class IndividualQuotationSaverImpl extends QuotationSaver {
  var _quotation = IndividualQuotationInfo();
  @override
  QuotationInfo fetchInfo() => _quotation;

  @override
  void saveData(InputFormEvent event) {
    if (event is InputName) {
      _quotation.name = event.text;
      return;
    } else if (event is InputEmail) {
      _quotation.email = event.text;
      return;
    } else if (event is InputPhoneNumber) {
      _quotation.phoneNumber = event.text;
      return;
    } else if (event is InputAgeBracket) {
      _quotation.ageBracket = event.text;
      return;
    } else if (event is InputCoverType) {
      _quotation.coverType = event.text;
      return;
    }
  }

  @override
  List<Object?> get props => [_quotation];

  @override
  void reset() {
    _quotation = IndividualQuotationInfo();
  }
}
