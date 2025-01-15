import 'package:flutter/material.dart';
import 'package:weather_app/models/cities.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/utilities/constants.dart';
import 'location_screen.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;
   Cities cities =  Cities(results: [], generationtimeMs: 0.0);

  void getCities() async {
    try {
      final cityInfo = await getCityInfo(cityName);
      setState(() {
        cities = cityInfo;
      });
      if(cities.results.isNotEmpty){
        final latitude = cities.results[0].latitude;
        final longitude = cities.results[0].longitude;
        final location = await getLocationInfo(latitude, longitude);
        final weather = await getWeatherInfo(location);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocationScreen(
              location: location,
              weather: weather,
            ),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),
                    hintText: 'Enter City Name',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  getCities();
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
              // Expanded(
              //   child:  ListView.builder(
              //     itemCount: cities.results.length,
              //     itemBuilder: (context, index) {
              //       return ListTile(
              //         title: Text(cities.results[index].name),
              //         onTap: () async {
              //           final latitude = cities.results[index].latitude;
              //           final longitude = cities.results[index].longitude;
  
              //           final location = await getLocationInfo(latitude, longitude);
              //           final weather = await getWeatherInfo(location);
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => LocationScreen(
              //                 location: location,
              //                 weather: weather,
              //               ),
              //             ),
              //           );
              //         },
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
