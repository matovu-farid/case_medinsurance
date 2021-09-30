class ClaimInfo {
  String? phoneNumber;
  String? treatmentDate;
  String? claimAmount;
  String? bankingDetails;
  String? authorizedOfficer;
  String? reason;
  String? name;
  Map<String, dynamic> toJson() {
    return {
      'name':name,
      'phoneNumber': phoneNumber,
      'treatmentDate': treatmentDate,
      'claimAmount': claimAmount,
      'bankingDetails': bankingDetails,
      'authorizedOfficer': authorizedOfficer,
      'reason': reason
    };
  }
}
