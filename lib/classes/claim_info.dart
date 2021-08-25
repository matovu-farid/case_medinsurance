class ClaimInfo {
  String? phoneNumber;
  String? treatmentDate;
  String? claimAmount;
  String? bankingDetails;
  String? authorizedOfficer;
  String? reason;
  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'treatmentDate': treatmentDate,
      'claimAmount': claimAmount,
      'bankingDetails': bankingDetails,
      'authorizedOfficer': authorizedOfficer,
      'reason': reason
    };
  }
}
