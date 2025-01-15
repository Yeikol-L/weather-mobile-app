// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
    double latitude;
    double longitude;
    double generationtimeMs;
    int utcOffsetSeconds;
    String timezone;
    String timezoneAbbreviation;
    double elevation;
    CurrentUnits currentUnits;
    Current current;

    Weather({
        required this.latitude,
        required this.longitude,
        required this.generationtimeMs,
        required this.utcOffsetSeconds,
        required this.timezone,
        required this.timezoneAbbreviation,
        required this.elevation,
        required this.currentUnits,
        required this.current,
    });

    factory Weather.fromJson(Map<String, dynamic> json) {
     return Weather(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        currentUnits: CurrentUnits.fromJson(json["current_units"]),
        current: Current.fromJson(json["current"]),
    );
    }

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "current_units": currentUnits.toJson(),
        "current": current.toJson(),
    };
}

class Current {
    String time;
    int interval;
    double temperature2M;
    int isDay;
    int weatherCode;

    Current({
        required this.time,
        required this.interval,
        required this.temperature2M,
        required this.isDay,
        required this.weatherCode,
    });

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        time: json["time"],
        interval: json["interval"],
        temperature2M: json["temperature_2m"]?.toDouble(),
        isDay: json["is_day"],
        weatherCode: json["weather_code"],
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
        "temperature_2m": temperature2M,
        "is_day": isDay,
    };
}

class CurrentUnits {
    String time;
    String interval;
    String temperature2M;
    String isDay;

    CurrentUnits({
        required this.time,
        required this.interval,
        required this.temperature2M,
        required this.isDay,
    });

    factory CurrentUnits.fromJson(Map<String, dynamic> json) => CurrentUnits(
        time: json["time"],
        interval: json["interval"],
        temperature2M: json["temperature_2m"],
        isDay: json["is_day"],
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "interval": interval,
        "temperature_2m": temperature2M,
        "is_day": isDay,
    };
}
