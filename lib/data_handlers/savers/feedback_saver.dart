import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/bloc/form_bloc/input_form_events.dart';
import 'package:case_app/classes/feedback_info.dart';

import 'form_saver.dart';

abstract class FeedbackSaver extends FormSaver<FeedbackInfo> {}

class FeedbackSaverImpl extends FeedbackSaver {
  var _feedback = FeedbackInfo();
  @override
  void saveData(InputFormEvent event) {
    if (event is InputAddress) {
      _feedback.address = event.text;
      return;
    } else if (event is InputCardNumber) {
      _feedback.cardNumber = event.text;
      return;
    } else if (event is InputPhoneNumber) {
      _feedback.phoneNumber = event.text;
      return;
    } else if (event is InputComplaints) {
      _feedback.complaints = event.text;
      return;
    } else if (event is InputCompany) {
      _feedback.company = event.text;
      return;
    }
    if (event is InputCompliments) {
      _feedback.compliments = event.text;
      return;
    }
    if (event is InputInquiry) {
      _feedback.inquiry = event.text;
      return;
    } else if (event is InputMostVisitedProvider) {
      _feedback.mostVistedProvider = event.text;
      return;
    } else if (event is InputOtherProviders) {
      _feedback.otherProviderVisited = event.text;
      return;
    }
  }

  @override
  FeedbackInfo fetchInfo() => _feedback;

  @override
  List<Object?> get props => [_feedback];

  @override
  void reset() {
    _feedback = FeedbackInfo();
  }
}
