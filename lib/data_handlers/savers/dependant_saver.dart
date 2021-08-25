import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/bloc/form_bloc/input_form_events.dart';
import 'package:case_app/classes/aplication_info.dart/application_info.dart';
import 'package:case_app/data_handlers/savers/form_saver.dart';

abstract class DependantSaver extends FormSaver<DependantInfo> {}

class DependantSaverImpl extends DependantSaver {
  var _dependant = DependantInfo();
  @override
  DependantInfo fetchInfo() {
    return _dependant;
  }

  @override
  void saveData(InputFormEvent event) {
    if (event is InputName) {
      _dependant.name = event.text;
    } else if (event is InputDateOfBirth) {
      _dependant.dateOfBirth = event.text;
    } else if (event is InputGender) {
      _dependant.gender = event.text;
    }
  }

  @override
  List<Object?> get props => [_dependant];

  @override
  void reset() {
    _dependant = DependantInfo();
  }
}
