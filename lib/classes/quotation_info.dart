import 'package:equatable/equatable.dart';
import 'package:firebase_helpers/firebase_helpers.dart';
import 'package:json_annotation/json_annotation.dart';
part 'quotation_info.g.dart';

abstract class QuotationInfo extends Equatable with FirebaseMixin {
  String? name;
  String? email;
  String? phoneNumber;
  QuotationInfo({
    this.name,
    this.email,
    this.phoneNumber,
  });

  Map<String, dynamic> get toJson;
  @override
  List<Object?> get props => [name, email, phoneNumber];
}

@JsonSerializable()
class CoorporateQuotationInfo extends QuotationInfo {
  String? noOfLives;
  String? typeOfBusiness;
  CoorporateQuotationInfo(
      {this.noOfLives,
      this.typeOfBusiness,
      
      String? name,
      String? email,
      String? phoneNumber})
      : super(name: name, email: email, phoneNumber: phoneNumber);
  @override
  Map<String, dynamic> get toJson => _$CoorporateQuotationInfoToJson(this);

  @override
  List<Object?> get props =>
      [...super.props, this.noOfLives, this.typeOfBusiness];
}

@JsonSerializable()
class IndividualQuotationInfo extends QuotationInfo {
  String? ageBracket;
  String? coverType;

  IndividualQuotationInfo(
      {this.ageBracket,
      this.coverType,
      String? name,
      String? email,
      String? phoneNumber})
      : super(name: name, email: email, phoneNumber: phoneNumber);
  @override
  Map<String, dynamic> get toJson => _$IndividualQuotationInfoToJson(this);
  @override
  List<Object?> get props => [...super.props, this.ageBracket, this.coverType];
}
