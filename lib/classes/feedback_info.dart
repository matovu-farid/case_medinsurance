import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'feedback_info.g.dart';

@JsonSerializable(explicitToJson: true)
class FeedbackInfo  extends Equatable{
 String? cardNumber;
  String? company;
  String? phoneNumber;
  String? address;
  String? mostVistedProvider;
  String? otherProviderVisited;
  String? complaints;
  String? compliments;
  String? inquiry;
  Map<String, dynamic> toJson() => _$FeedbackInfoToJson(this);





  FeedbackInfo();

  @override
  List<Object?> get props => [
  cardNumber,
  company,
  phoneNumber,
  address,
  mostVistedProvider,
  otherProviderVisited,
  complaints,
  compliments,
  inquiry,
  ];
}

