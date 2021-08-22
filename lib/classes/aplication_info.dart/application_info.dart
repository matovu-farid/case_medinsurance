import 'package:json_annotation/json_annotation.dart';

part 'application_info.g.dart';

@JsonSerializable(explicitToJson: true)
class ApplicationInfo {
  List<Dependant> dependants;
  ClientData clientInfo;

  
  ApplicationInfo(
    this.dependants,
    this.clientInfo,
  );
  factory ApplicationInfo.fromJson(Map<String, dynamic> json) =>
      _$ApplicationInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ClientData {
  String? company;
  String? name;
  String? phonenumber;
  String? dateOfBirth;
  String? gender;
  String? email;
  String? address;
  ClientData();

  factory ClientData.fromJson(Map<String, dynamic> json) =>
      _$ClientDataFromJson(json);
  Map<String, dynamic> toJson() => _$ClientDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Dependant {
  String? name;
  String? gender;
  String? dateOfBirth;
  Dependant();

  factory Dependant.fromJson(Map<String, dynamic> json) =>
      _$DependantFromJson(json);
  Map<String, dynamic> toJson() => _$DependantToJson(this);
}
