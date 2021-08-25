import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/bloc/form_bloc/input_form_events.dart';
import 'package:case_app/classes/quotation_info.dart';
import 'package:case_app/data_handlers/savers/application_saver.dart';
import 'package:case_app/data_handlers/savers/dependant_saver.dart';
import 'package:case_app/data_handlers/savers/quotation_saver.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late DependantSaver saver;
  setUp(() {
    saver = DependantSaverImpl();
  });

  group('should save the dependant data correctly', () {
  
    test('save the name in the dependant', () {
      var name = 'xxxxxxxx';
      InputFormEvent event = InputName(name);
      saver.saveData(event);
      var dependantInfo = saver.fetchInfo();
      expect(dependantInfo.name, name);
    });
  
    test('save the D.O.B in the dependant', () {
      var dateOfBirth = 'xxxxxxxx';
      InputFormEvent event = InputDateOfBirth(dateOfBirth);
      saver.saveData(event);
      var dependantInfo = saver.fetchInfo();
      expect(dependantInfo.dateOfBirth, dateOfBirth);
    });
  
    test('save the gender in the dependant', () {
      var gender = 'xxxxxxxx';
      InputFormEvent event = InputGender(gender);
      saver.saveData(event);
      var dependantInfo = saver.fetchInfo();
      expect(dependantInfo.gender, gender);
    });
 
  });
}
