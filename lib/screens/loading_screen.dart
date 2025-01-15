import 'package:flutter/material.dart';
import 'package:weather_app/models/location.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/networking.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final location = await getLocationInfo(null, null);
            final weather = await getWeatherInfo(location);
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LocationScreen(location: location, weather: weather);
            }));
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
