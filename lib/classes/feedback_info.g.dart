// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackInfo _$FeedbackInfoFromJson(Map<String, dynamic> json) {
  return FeedbackInfo()
    ..cardNumber = json['cardNumber'] as String?
    ..company = json['company'] as String?
    ..phoneNumber = json['phoneNumber'] as String?
    ..address = json['address'] as String?
    ..mostVistedProvider = json['mostVistedProvider'] as String?
    ..otherProviderVisited = json['otherProviderVisited'] as String?
    ..complaints = json['complaints'] as String?
    ..compliments = json['compliments'] as String?
    ..inquiry = json['inquiry'] as String?;
}

Map<String, dynamic> _$FeedbackInfoToJson(FeedbackInfo instance) =>
    <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'company': instance.company,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'mostVistedProvider': instance.mostVistedProvider,
      'otherProviderVisited': instance.otherProviderVisited,
      'complaints': instance.complaints,
      'compliments': instance.compliments,
      'inquiry': instance.inquiry,
    };
