 class FeedbackInfo {
  String? company;
  String? phoneNumber;
  String? address;
  String? mostVistedProvider;
  String? otherProviderVisited;
  String? complaints;
  String? compliments;
  String? inquiry;
  get getCompany => this.company;

  set setCompany(company) => this.company = company;

  get getPhoneNumber => this.phoneNumber;

  set setPhoneNumber(phoneNumber) => this.phoneNumber = phoneNumber;

  get getAddress => this.address;

  set setAddress(address) => this.address = address;

  get getMostVistedProvider => this.mostVistedProvider;

  set setMostVistedProvider(mostVistedProvider) =>
      this.mostVistedProvider = mostVistedProvider;

  get getOtherProviderVisited => this.otherProviderVisited;

  set setOtherProviderVisited(otherProviderVisited) =>
      this.otherProviderVisited = otherProviderVisited;

  get getComplaints => this.complaints;

  set setComplaints(complaints) => this.complaints = complaints;

  get getCompliments => this.compliments;

  set setCompliments(compliments) => this.compliments = compliments;

  get getInquiry => this.inquiry;

  set setInquiry(inquiry) => this.inquiry = inquiry;

  FeedbackInfo();

  @override
  submit() {
    // TODO: implement submit
    throw UnimplementedError();
  }
}

class MemberFeedback extends FeedbackInfo {
  String? cardNumber;
 String? get getCardNumber => this.cardNumber;

 set setCardNumber(String? cardNumber) => this.cardNumber = cardNumber;
  @override
  submit() {
    // TODO: implement submit
    throw UnimplementedError();
  }
}
