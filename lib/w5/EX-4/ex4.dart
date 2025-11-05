import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: const Color.fromARGB(255, 77, 188, 240),
          flexibleSpace: Container(
            padding: EdgeInsets.only(right: 20),
            alignment: Alignment.centerRight,
            child: Icon(Icons.menu, color: Colors.white,),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 20,
                children: [
                  WeatherCard(
                    weather: Weather.cloudy,
                    city: "Phnom Penh",
                    temp: "34.0",
                    minTemp: "31.0",
                    maxTemp: "37.0",
                  ),
                  WeatherCard(
                    weather: Weather.sunnyCloudy,
                    city: "Paris",
                    temp: "34.0",
                    minTemp: "31.0",
                    maxTemp: "37.0",
                  ),
                  WeatherCard(
                    weather: Weather.sunny,
                    city: "Rome",
                    temp: "34.0",
                    minTemp: "31.0",
                    maxTemp: "37.0",
                  ),
                  WeatherCard(
                    weather: Weather.veryCloudy,
                    city: "Toulouse",
                    temp: "34.0",
                    minTemp: "31.0",
                    maxTemp: "37.0",
                  ),
                  WeatherCard(
                    weather: Weather.sunny,
                    city: "Toronto",
                    temp: "34.0",
                    minTemp: "31.0",
                    maxTemp: "37.0",
                  ),
                  WeatherCard(
                    weather: Weather.sunnyCloudy,
                    city: "Berlin",
                    temp: "34.0",
                    minTemp: "31.0",
                    maxTemp: "37.0",
                  ),
                  WeatherCard(
                    weather: Weather.cloudy,
                    city: "Moscow",
                    temp: "34.0",
                    minTemp: "31.0",
                    maxTemp: "37.0",
                  ),
                  WeatherCard(
                    weather: Weather.sunny,
                    city: "Florida",
                    temp: "34.0",
                    minTemp: "31.0",
                    maxTemp: "37.0",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

enum Weather {
  cloudy(
    'assets/weather/cloudy.png',
    LinearGradient(
      colors: [
        Color.fromARGB(255, 151, 114, 251),
        Color.fromARGB(255, 124, 77, 255),
      ],
    ),
  ),
  sunny(
    'assets/weather/sunny.png',
    LinearGradient(
      colors: [
        Color.fromARGB(255, 248, 91, 143),
        Color.fromARGB(255, 250, 63, 125),
      ],
    ),
  ),
  sunnyCloudy(
    'assets/weather/sunnyCloudy.png',
    LinearGradient(
      colors: [
        Color.fromARGB(255, 126, 246, 218),
        Color.fromARGB(255, 58, 220, 182),
      ],
    ),
  ),
  veryCloudy(
    'assets/weather/veryCloudy.png',
    LinearGradient(
      colors: [
        Color.fromARGB(255, 246, 169, 86),
        Color.fromARGB(255, 249, 185, 115),
      ],
    ),
  );

  final String image;
  final LinearGradient gradient;

  const Weather(this.image, this.gradient);
}

class WeatherCard extends StatelessWidget {
  final Weather weather;
  final String city;
  final String temp;
  final String minTemp;
  final String maxTemp;

  const WeatherCard({
    super.key,
    required this.weather,
    required this.city,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      clipBehavior: Clip.hardEdge,
      color: Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(18)),
      elevation: 6.0,
      child: Container(
        decoration: BoxDecoration(gradient: weather.gradient),
        child: Stack(
          children: [
            Positioned(
              right: -50,
              top: -20,
              child: CircleAvatar(
                radius: 125,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: weather.gradient,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 20,
                right: 20,
                bottom: 60,
              ),
              child: Row(
                spacing: 10,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: Image(image: AssetImage(weather.image), width: 65),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        city,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Min $minTemp˚C",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        "Max $maxTemp˚C",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,

                    child: Text(
                      "$temp˚C",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
