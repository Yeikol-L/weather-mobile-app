import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/cities.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/models/location.dart';
import 'package:http/http.dart' as http;


//https://nominatim.openstreetmap.org/reverse?lat=18.48456&lon=-69.95008&format=json
Future<Location> getLocationInfo(double? lat, double? long) async {

  late double latitude;
  late double longitude;

  // Get the current location
  if(lat == null || long == null) {
    final Position position = await determinePosition();
    latitude = position.latitude;
    longitude = position.longitude;
  } else {
    latitude = lat as double;
    longitude = long as double;
  }


  // Get the location information
  final String url = 'https://nominatim.openstreetmap.org/reverse?lat=$latitude&lon=$longitude&format=json';
  final http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    return Location.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load location information');
  }}

// https://api.open-meteo.com/v1/forecast?latitude=18.4846&longitude=-69.9501&current=temperature_2m,is_day&timezone=auto

Future<Weather> getWeatherInfo(Location location) async {
  final double latitude = double.parse(location.lat);
  final double longitude = double.parse(location.lon);

  final String url = 'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m,is_day,weather_code&timezone=auto';
  final http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return Weather.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load weather information');
  }
}

// https://geocoding-api.open-meteo.com/v1/search?name=Sa&count=10&language=en&format=json

Future<Cities> getCityInfo(String cityName) async {
  final String url = 'https://geocoding-api.open-meteo.com/v1/search?name=$cityName&count=1&language=es&format=json';
  final http.Response response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return Cities.fromJson(data);
  } else {
    throw Exception('Failed to load city information');
  }
}
