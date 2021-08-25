// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotation_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoorporateQuotationInfo _$CoorporateQuotationInfoFromJson(
    Map<String, dynamic> json) {
  return CoorporateQuotationInfo(
    noOfLives: json['noOfLives'] as String?,
    typeOfBusiness: json['typeOfBusiness'] as String?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
  );
}

Map<String, dynamic> _$CoorporateQuotationInfoToJson(
        CoorporateQuotationInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'noOfLives': instance.noOfLives,
      'typeOfBusiness': instance.typeOfBusiness,
    };

IndividualQuotationInfo _$IndividualQuotationInfoFromJson(
    Map<String, dynamic> json) {
  return IndividualQuotationInfo(
    ageBracket: json['ageBracket'] as String?,
    coverType: json['coverType'] as String?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
  );
}

Map<String, dynamic> _$IndividualQuotationInfoToJson(
        IndividualQuotationInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'ageBracket': instance.ageBracket,
      'coverType': instance.coverType,
    };
