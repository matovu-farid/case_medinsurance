import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application_info.g.dart';

@JsonSerializable(explicitToJson: true)
class ApplicationInfo extends Equatable {
  List<DependantInfo> dependants;
  ClientData clientInfo;

  ApplicationInfo(
    this.dependants,
    this.clientInfo,
  );
  factory ApplicationInfo.fromJson(Map<String, dynamic> json) =>
      _$ApplicationInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationInfoToJson(this);

  @override
  List<Object?> get props => [dependants, clientInfo];
}

@JsonSerializable(explicitToJson: true)
class ClientData extends Equatable {
  String? company;
  String? name;
  String? phoneNumber;
  String? dateOfBirth;
  String? gender;
  String? email;
  String? address;
  ClientData();

  factory ClientData.fromJson(Map<String, dynamic> json) =>
      _$ClientDataFromJson(json);
  Map<String, dynamic> toJson() => _$ClientDataToJson(this);

  @override
  List<Object?> get props => [
        name,
        company,
        phoneNumber,
        dateOfBirth,
        gender,
        email,
        address,
      ];
}

@JsonSerializable(explicitToJson: true)
class DependantInfo extends Equatable {
  String? name;
  String? gender;
  String? dateOfBirth;
  DependantInfo();

  bool get isFilled => 
  name != null && name!.isNotEmpty&&
  gender != null && gender!.isNotEmpty&&
  dateOfBirth != null &&
      dateOfBirth!.isNotEmpty
  ;

  factory DependantInfo.fromJson(Map<String, dynamic> json) =>
      _$DependantInfoFromJson(json);
  Map<String, dynamic> toJson() => _$DependantInfoToJson(this);

  @override
  List<Object?> get props => [name, gender, dateOfBirth];
}
