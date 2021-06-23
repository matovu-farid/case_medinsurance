class City {
    List<CityX> cities;

    City({this.cities});

    factory City.fromJson(Map<String, dynamic> json) {
        return City(
            cities: json['cities'] != null ? (json['cities'] as List).map((i) => CityX.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.cities != null) {
            data['cities'] = this.cities.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class CityX {
    List<double> coordinates;
    String name;

    CityX({this.coordinates, this.name});

    factory CityX.fromJson(Map<String, dynamic> json) {
        return CityX(
            coordinates: json['coordinates'] != null ? new List<double>.from(json['coordinates']) : null,
            name: json['name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['name'] = this.name;
        if (this.coordinates != null) {
            data['coordinates'] = this.coordinates;
        }
        return data;
    }
}