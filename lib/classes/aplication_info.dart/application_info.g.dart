// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationInfo _$ApplicationInfoFromJson(Map<String, dynamic> json) {
  return ApplicationInfo(
    (json['dependants'] as List<dynamic>)
        .map((e) => Dependant.fromJson(e as Map<String, dynamic>))
        .toList(),
    ClientData.fromJson(json['clientInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ApplicationInfoToJson(ApplicationInfo instance) =>
    <String, dynamic>{
      'dependants': instance.dependants.map((e) => e.toJson()).toList(),
      'clientInfo': instance.clientInfo.toJson(),
    };

ClientData _$ClientDataFromJson(Map<String, dynamic> json) {
  return ClientData()
    ..company = json['company'] as String?
    ..name = json['name'] as String?
    ..phonenumber = json['phonenumber'] as String?
    ..dateOfBirth = json['dateOfBirth'] as String?
    ..gender = json['gender'] as String?
    ..email = json['email'] as String?
    ..address = json['address'] as String?;
}

Map<String, dynamic> _$ClientDataToJson(ClientData instance) =>
    <String, dynamic>{
      'company': instance.company,
      'name': instance.name,
      'phonenumber': instance.phonenumber,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'email': instance.email,
      'address': instance.address,
    };

Dependant _$DependantFromJson(Map<String, dynamic> json) {
  return Dependant()
    ..name = json['name'] as String?
    ..gender = json['gender'] as String?
    ..dateOfBirth = json['dateOfBirth'] as String?;
}

Map<String, dynamic> _$DependantToJson(Dependant instance) => <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
    };