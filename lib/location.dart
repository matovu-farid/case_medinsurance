import 'dart:async';

import 'package:rxdart/rxdart.dart';

class Location {
    List<Feature> features;

    Location({this.features});

    factory Location.fromJson(Map<String, dynamic> json) {
        return Location(
            features: json['features'] != null ? (json['features'] as List).map((i) => Feature.fromJson(i)).toList() : null,
        );
    }


    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.features != null) {
            data['features'] = this.features.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Feature {
    List<double> coordinates;
    Properties properties;

    Feature({this.coordinates, this.properties});

    factory Feature.fromJson(Map<String, dynamic> json) {
        return Feature(
            coordinates: json['coordinates'] != null ? new List<double>.from(json['coordinates']) : null,
            properties: json['properties'] != null ? Properties.fromJson(json['properties']) : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.coordinates != null) {
            data['coordinates'] = this.coordinates;
        }
        if (this.properties != null) {
            data['properties'] = this.properties.toJson();
        }
        return data;
    }
}

class Properties {
    String id;
    String name;

    Properties({this.id, this.name});

    factory Properties.fromJson(Map<String, dynamic> json) {
        return Properties(
            id: json['id'],
            name: json['name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;
        return data;
    }
}