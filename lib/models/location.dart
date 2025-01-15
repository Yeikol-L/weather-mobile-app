
import 'dart:convert';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
    String lat;
    String lon;
    String name;
    String displayName;
    Address address;

    Location({
        required this.lat,
        required this.lon,
        required this.name,
        required this.displayName,
        required this.address,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"],
        lon: json["lon"],
        name: json["name"],
        displayName: json["display_name"],
        address: Address.fromJson(json["address"]),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "name": name,
        "display_name": displayName,
        "address": address.toJson(),
    };
}

class Address {
    String? city;
    String state;
    String country;

    Address({
        required this.city,
        required this.state,
        required this.country,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        city: json["city"],
        state: json["state"],
        country: json["country"],
    );

    Map<String, dynamic> toJson() => {
        "city": city,
        "state": state,
        "country": country,
    };
}
