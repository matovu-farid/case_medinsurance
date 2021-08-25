import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/bloc/form_bloc/input_form_events.dart';
import 'package:case_app/classes/quotation_info.dart';
import 'package:case_app/data_handlers/savers/feedback_saver.dart';
import 'package:case_app/data_handlers/savers/quotation_saver.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late QuotationSaver saver;
  setUp(() {
    saver = CooperateQuotationSaverImpl();
  });

  group('should save the quotation data correctly', () {
    test('save the phone number in the quotation', () {
      var number = 'O705222144';
      InputFormEvent event = InputPhoneNumber(number);
      saver.saveData(event);
      var quotationInfo = saver.fetchInfo();
      expect(quotationInfo.phoneNumber, number);
    });
    test('save the name in the quotation', () {
      var name = 'xxxxxxxx';
      InputFormEvent event = InputName(name);
      saver.saveData(event);
      var quotationInfo = saver.fetchInfo();
      expect(quotationInfo.name, name);
    });
    test('save the email in the quotation', () {
      var email = 'xxxxxxxx';
      InputFormEvent event = InputEmail(email);
      saver.saveData(event);
      var quotationInfo = saver.fetchInfo();
      expect(quotationInfo.email, email);
    });
  });
  group('should save the cooporate quotation data', () {
    test('save the typeOfBusiness in the quotation', () {
      var typeOfBusiness = 'xxxxxxxx';
      InputFormEvent event = InputTypeOfBusiness(typeOfBusiness);
      saver.saveData(event);
      var quotationInfo = saver.fetchInfo() as CoorporateQuotationInfo;

      expect(quotationInfo.typeOfBusiness, typeOfBusiness);
    });
    test('save the noOfLives in the quotation', () {
      var noOfLives = 'xxxxxxxx';
      InputFormEvent event = InputNoOfLives(noOfLives);
      saver.saveData(event);
      var quotationInfo = saver.fetchInfo() as CoorporateQuotationInfo;

      expect(quotationInfo.noOfLives, noOfLives);
    });
  });
  group('should save the individual quotation data', () {
    setUp(() {
      saver = IndividualQuotationSaverImpl();
    });

    test('save the typeOfBusiness in the quotation', () {
      var coverType = 'xxxxxxxx';
      InputFormEvent event = InputCoverType(coverType);
      saver.saveData(event);
      var quotationInfo = saver.fetchInfo() as IndividualQuotationInfo;

      expect(quotationInfo.coverType, coverType);
    });
    test('save the age-bracket in the quotation', () {
      var ageBracket = 'xxxxxxxx';
      InputFormEvent event = InputAgeBracket(ageBracket);
      saver.saveData(event);
      var quotationInfo = saver.fetchInfo() as IndividualQuotationInfo;

      expect(quotationInfo.ageBracket, ageBracket);
    });
  });
}
