// To parse this JSON data, do
//
//     final cities = citiesFromJson(jsonString);

import 'dart:convert';

Cities citiesFromJson(String str) => Cities.fromJson(json.decode(str));

String citiesToJson(Cities data) => json.encode(data.toJson());

class Cities {
    List<Result> results;
    double generationtimeMs;

    Cities({
        required this.results,
        required this.generationtimeMs,
    });

    factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "generationtime_ms": generationtimeMs,
    };
}

class Result {
    int id;
    String name;
    double latitude;
    double longitude;
    double elevation;
    String featureCode;
    String countryCode;
    int? admin1Id;
    int? admin2Id;
    int? admin3Id;
    String timezone;
    List<String>? postcodes;
    int countryId;
    String country;
    String? admin1;
    String? admin2;
    String? admin3;

    Result({
        required this.id,
        required this.name,
        required this.latitude,
        required this.longitude,
        required this.elevation,
        required this.featureCode,
        required this.countryCode,
        this.admin1Id,
        this.admin2Id,
        this.admin3Id,
        required this.timezone,
        this.postcodes,
        required this.countryId,
        required this.country,
        this.admin1,
        this.admin2,
        this.admin3,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        elevation: json["elevation"],
        featureCode: json["feature_code"],
        countryCode: json["country_code"],
        admin1Id: json["admin1_id"],
        admin2Id: json["admin2_id"],
        admin3Id: json["admin3_id"],
        timezone: json["timezone"],
        postcodes: json["postcodes"] == null ? [] : List<String>.from(json["postcodes"]!.map((x) => x)),
        countryId: json["country_id"],
        country: json["country"],
        admin1: json["admin1"],
        admin2: json["admin2"],
        admin3: json["admin3"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "elevation": elevation,
        "feature_code": featureCode,
        "country_code": countryCode,
        "admin1_id": admin1Id,
        "admin2_id": admin2Id,
        "admin3_id": admin3Id,
        "timezone": timezone,
        "postcodes": postcodes == null ? [] : List<dynamic>.from(postcodes!.map((x) => x)),
        "country_id": countryId,
        "country": country,
        "admin1": admin1,
        "admin2": admin2,
        "admin3": admin3,
    };
}





