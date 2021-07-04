import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

class Contacts {
  String? customerCare;
  String? clinicNetwork;
  String? claims;
  String? membershipCards;
  String? generalLine;
  String? tollFree;
  String? email;
  String? website;

  Contacts({
    this.customerCare,
    this.clinicNetwork,
    this.claims,
    this.membershipCards,
    this.generalLine,
    this.tollFree,
    this.email,
    this.website,
  });

  @override
  String toString() {
    return 'Contacts(customerCare: $customerCare, clinicNetwork: $clinicNetwork, claims: $claims, membershipCards: $membershipCards, generalLine: $generalLine, tollFree: $tollFree, email: $email, website: $website)';
  }

  static final _logger = Logger('Contacts');

  static Future<Contacts> fromLocalJson(String assetName) async {
    var jsonString = await rootBundle.loadString(assetName);

    var json = jsonDecode(jsonString);
    _logger.info(json);
    var contacts = Contacts.fromJson(json);
    _logger.info(contacts.toJson());
    return contacts;
  }

  factory Contacts.fromJson(Map<String, dynamic> json) => Contacts(
        customerCare: json['Customer Care'],
        clinicNetwork: json['Clinic Network'],
        claims: json['Claims'],
        membershipCards: json['Membership Cards'],
        generalLine: json['General Line'],
        tollFree: json['Toll Free'],
        email: json['Email'],
        website: json['Website'],
      );

  Map<String, dynamic> toJson() => {
        'Customer Care': customerCare,
        'Clinic Network': clinicNetwork,
        'Claims': claims,
        'Membership Cards': membershipCards,
        'General Line': generalLine,
        'Toll Free': tollFree,
        'Email': email,
        'Website': website,
      };

  Contacts copyWith({
    String? customerCare,
    String? clinicNetwork,
    String? claims,
    String? membershipCards,
    String? generalLine,
    String? tollFree,
    String? email,
    String? website,
  }) {
    return Contacts(
      customerCare: customerCare ?? this.customerCare,
      clinicNetwork: clinicNetwork ?? this.clinicNetwork,
      claims: claims ?? this.claims,
      membershipCards: membershipCards ?? this.membershipCards,
      generalLine: generalLine ?? this.generalLine,
      tollFree: tollFree ?? this.tollFree,
      email: email ?? this.email,
      website: website ?? this.website,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Contacts &&
        other.customerCare == customerCare &&
        other.clinicNetwork == clinicNetwork &&
        other.claims == claims &&
        other.membershipCards == membershipCards &&
        other.generalLine == generalLine &&
        other.tollFree == tollFree &&
        other.email == email &&
        other.website == website;
  }

  @override
  int get hashCode =>
      customerCare.hashCode ^
      clinicNetwork.hashCode ^
      claims.hashCode ^
      membershipCards.hashCode ^
      generalLine.hashCode ^
      tollFree.hashCode ^
      email.hashCode ^
      website.hashCode;
}
