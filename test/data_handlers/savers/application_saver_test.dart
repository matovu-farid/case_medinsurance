import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/bloc/form_bloc/input_form_events.dart';
import 'package:case_app/classes/aplication_info.dart/application_info.dart';
import 'package:case_app/classes/quotation_info.dart';
import 'package:case_app/data_handlers/savers/application_saver.dart';
import 'package:case_app/data_handlers/savers/quotation_saver.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDependant extends Mock implements DependantInfo {}

main() {
  late ApplicationSaver saver;
  setUp(() {
    saver = ApplicationSaverImpl();
  });
  test('should save the dependant', () {
    var dependant = MockDependant();
    saver.saveData(InputDependant(dependant));
    expect(saver.fetchInfo().dependants, contains(dependant));
  });

  group('should save the clientInfo data correctly', () {
    test('save the phone number in the clientInfo', () {
      var number = 'O705222144';
      InputFormEvent event = InputPhoneNumber(number);
      saver.saveData(event);
      var clientInfo = saver.fetchInfo().clientInfo;
      expect(clientInfo.phoneNumber, number);
    });
    test('save the name in the clientInfo', () {
      var name = 'xxxxxxxx';
      InputFormEvent event = InputName(name);
      saver.saveData(event);
      var clientInfo = saver.fetchInfo().clientInfo;
      expect(clientInfo.name, name);
    });
    test('save the email in the clientInfo', () {
      var email = 'xxxxxxxx';
      InputFormEvent event = InputEmail(email);
      saver.saveData(event);
      var clientInfo = saver.fetchInfo().clientInfo;
      expect(clientInfo.email, email);
    });
    test('save the D.O.B in the clientInfo', () {
      var dateOfBirth = 'xxxxxxxx';
      InputFormEvent event = InputDateOfBirth(dateOfBirth);
      saver.saveData(event);
      var clientInfo = saver.fetchInfo().clientInfo;
      expect(clientInfo.dateOfBirth, dateOfBirth);
    });
    test('save the company in the clientInfo', () {
      var company = 'xxxxxxxx';
      InputFormEvent event = InputCompany(company);
      saver.saveData(event);
      var clientInfo = saver.fetchInfo().clientInfo;
      expect(clientInfo.company, company);
    });
    test('save the gender in the clientInfo', () {
      var gender = 'xxxxxxxx';
      InputFormEvent event = InputGender(gender);
      saver.saveData(event);
      var clientInfo = saver.fetchInfo().clientInfo;
      expect(clientInfo.gender, gender);
    });
    test('save the gender in the clientInfo', () {
      var address = 'xxxxxxxx';
      InputFormEvent event = InputAddress(address);
      saver.saveData(event);
      var clientInfo = saver.fetchInfo().clientInfo;
      expect(clientInfo.address, address);
    });
  });
}
