import 'package:case_app/bloc/form_bloc/form_bloc.dart';
import 'package:case_app/classes/aplication_info.dart/application_info.dart';

abstract class FeedbackEvent {}


class InputDependant extends InputFormEvent {
  final DependantInfo dependant;
  InputDependant( this.dependant,
    {String? text,}
  ) : super(text);
}
class InputTreatmentDate extends InputFormEvent {
  InputTreatmentDate(String? text) : super(text);
}
class InputAuthorizingOfficer extends InputFormEvent{
  InputAuthorizingOfficer(String? text) : super(text);
}
class InputClaimAmount extends InputFormEvent{
  InputClaimAmount(String? text) : super(text);
}
class InputReason extends InputFormEvent{
  InputReason(String? text) : super(text);
}
class InputBankingDetails extends InputFormEvent{
  InputBankingDetails(String? text) : super(text);
}
class InputGender extends InputFormEvent {
  InputGender(String? text) : super(text);
}

class InputDateOfBirth extends InputFormEvent {
  InputDateOfBirth(String? text) : super(text);
}

class InputName extends InputFormEvent {
  InputName(String? text) : super(text);
}

class InputAgeBracket extends InputFormEvent {
  InputAgeBracket(String? text) : super(text);
}

class InputCoverType extends InputFormEvent {
  InputCoverType(String? text) : super(text);
}

class InputTypeOfBusiness extends InputFormEvent {
  InputTypeOfBusiness(String? text) : super(text);
}

class InputNoOfLives extends InputFormEvent {
  InputNoOfLives(String? text) : super(text);
}

class InputEmail extends InputFormEvent {
  InputEmail(String? text) : super(text);
}

class InputPhoneNumber extends InputFormEvent {
  InputPhoneNumber(String? text) : super(text);
}

class InputAddress extends InputFormEvent {
  InputAddress(String? text) : super(text);
}

class InputCardNumber extends InputFormEvent {
  InputCardNumber(String? text) : super(text);
}

class InputMostVisitedProvider extends InputFormEvent {
  InputMostVisitedProvider(String? text) : super(text);
}

class InputOtherProviders extends InputFormEvent {
  InputOtherProviders(String? text) : super(text);
}

class InputCompany extends InputFormEvent {
  InputCompany(String? text) : super(text);
}

class InputComplaints extends InputFormEvent {
  InputComplaints(String? text) : super(text);
}

class InputInquiry extends InputFormEvent {
  InputInquiry(String? text) : super(text);
}

class InputCompliments extends InputFormEvent {
  InputCompliments(String? text) : super(text);
}
