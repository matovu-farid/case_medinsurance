import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/bloc/form_bloc/input_form_events.dart';
import 'package:case_app/classes/claim_info.dart';
import 'package:case_app/screens/forms/claim.dart';

import 'form_saver.dart';

abstract class ClaimSaver extends FormSaver<ClaimInfo> {}

class ClaimSaverImpl extends ClaimSaver {
  var claimInfo = ClaimInfo();
  @override
  ClaimInfo fetchInfo() {
    return claimInfo;
  }

  @override
  void saveData(InputFormEvent event) {
    if (event is InputPhoneNumber) {
      claimInfo.phoneNumber = event.text;
    } else if (event is InputTreatmentDate) {
      claimInfo.treatmentDate = event.text;
    } else if (event is InputBankingDetails) {
      claimInfo.bankingDetails = event.text;
    } else if (event is InputClaimAmount) {
      claimInfo.claimAmount = event.text;
    } else if (event is InputAuthorizingOfficer) {
      claimInfo.authorizedOfficer = event.text;
    } else if (event is InputReason) {
      claimInfo.reason = event.text;
    }
  }

  @override
  List<Object?> get props => [claimInfo];

  @override
  void reset() {
    claimInfo = ClaimInfo();
  }
}
