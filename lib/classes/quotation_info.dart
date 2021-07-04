abstract class QuotationInfo {
  String name;
  String email;
  String phoneNumber;
  QuotationInfo({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });
  submit();
}

class CorporateQuotationInfo extends QuotationInfo {
  final String noOfLives;
  final String typeOfBusiness;
  CorporateQuotationInfo(
      {required this.noOfLives,required  this.typeOfBusiness, 
        required String name,
      required String email,
      required String phoneNumber})
      : super(name: name, email: email, phoneNumber: phoneNumber);

  @override
  submit() {
    // TODO: implement submit
    throw UnimplementedError();
  }
}

class IndividualQuotationInfo extends QuotationInfo {
  final String ageBracket;
  final String coverType;

  IndividualQuotationInfo(
      {required this.ageBracket,required this.coverType,
        required String name,
      required String email,
      required String phoneNumber})
      : super(name: name, email: email, phoneNumber: phoneNumber);

  @override
  submit() {
    // TODO: implement submit
    throw UnimplementedError();
  }
}
