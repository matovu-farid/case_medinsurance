import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/bloc/form_bloc/input_form_events.dart';
import 'package:case_app/classes/aplication_info.dart/application_info.dart';
import 'package:equatable/equatable.dart';

import 'form_saver.dart';

abstract class ApplicationSaver extends FormSaver<ApplicationInfo> {}

class ApplicationSaverImpl extends ApplicationSaver {
  var clientInfo = ClientData();
  var dependants = <DependantInfo>[];
  @override
  ApplicationInfo fetchInfo() {
    return ApplicationInfo(dependants, clientInfo);
  }

  @override
  void saveData(InputFormEvent event) {
    if (event is InputName) {
      clientInfo.name = event.text;
    } else if (event is InputAddress) {
      clientInfo.address = event.text;
    } else if (event is InputEmail) {
      clientInfo.email = event.text;
    } else if (event is InputDateOfBirth) {
      clientInfo.dateOfBirth = event.text;
    } else if (event is InputCompany) {
      clientInfo.company = event.text;
    } else if (event is InputPhoneNumber) {
      clientInfo.phoneNumber = event.text;
    } else if (event is InputGender) {
      clientInfo.gender = event.text;
    } else if (event is InputDependant) {
      dependants.add(event.dependant);
    }
  }

  @override
  List<Object?> get props => [clientInfo, dependants];

  @override
  void reset() {
    clientInfo = ClientData();
    dependants.clear();
  }
}
