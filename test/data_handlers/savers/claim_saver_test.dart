import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/bloc/form_bloc/input_form_events.dart';
import 'package:case_app/data_handlers/savers/claim_saver.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('should save the claim info correctly', () {
    late ClaimSaver saver;
    setUp(() {
      saver = ClaimSaverImpl();
    });
    test('should save the phone number in the claim', () {
      var number = 'O705222144';
      InputFormEvent event = InputPhoneNumber(number);
      saver.saveData(event);
      var claimInfo = saver.fetchInfo();
      expect(claimInfo.phoneNumber, number);
    });
    test('should save the authorization officer in the claim', () {
      var value = 'xxxxxxxxx';
      InputFormEvent event = InputAuthorizingOfficer(value);
      saver.saveData(event);
      var claimInfo = saver.fetchInfo();
      expect(claimInfo.authorizedOfficer, value);
    });
    test('should save the banking details in the claim', () {
      var value = 'xxxxxxxxx';
      InputFormEvent event = InputBankingDetails(value);
      saver.saveData(event);
      var claimInfo = saver.fetchInfo();
      expect(claimInfo.bankingDetails, value);
    });
    test('should save the reason in the claim', () {
      var value = 'xxxxxxxxx';
      InputFormEvent event = InputReason(value);
      saver.saveData(event);
      var claimInfo = saver.fetchInfo();
      expect(claimInfo.reason, value);
    });
    test('should save the claim amount in the claim', () {
      var value = 'xxxxxxxxx';
      InputFormEvent event = InputClaimAmount(value);
      saver.saveData(event);
      var claimInfo = saver.fetchInfo();
      expect(claimInfo.claimAmount, value);
    });
    test('should save the treatment date in the claim', () {
      var value = 'xxxxxxxxx';
      InputFormEvent event = InputTreatmentDate(value);
      saver.saveData(event);
      var claimInfo = saver.fetchInfo();
      expect(claimInfo.treatmentDate, value);
    });
    
  });
}
