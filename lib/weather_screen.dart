import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/addition_info_items.dart';
import 'package:weather_app/credentials.dart';
import 'package:weather_app/weather_forecast_additional.dart';
import 'package:http/http.dart' as http;

// import 'package:http/http.dart' as http;

// import 'package:weather_app/weather_forecast_additional.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
 
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {
    try {
     
      const cityName = 'Chennai';
      final res = await http.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKEY"),
      );
      final data = jsonDecode(res.body);
      if (int.parse(data['cod']) != 200) {
        throw "An Unexpected error Occured";
      }
      print(data);
     
    } catch (e) {
      throw e.toString();
    }
   
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blackboard Application',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  debugPrint('hello World');
                },
              ))
        ],
      ),
      body:
       FutureBuilder(
        future: getCurrentWeather(),
         builder: (context, snapshot) {
          // print(snapshot);
          // print(snapshot.runtimeType);
          if(snapshot.connectionState== ConnectionState.waiting){
            return const  Center(child:  CircularProgressIndicator());
          }

          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
           return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 15,
                width: 50,
              ),
              SizedBox(
                width: double.infinity,
                child: Card(
                  color: const Color.fromARGB(189, 138, 229, 153),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  elevation: 10,
                  child:  Padding(
                    padding:const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding:const EdgeInsets.all(8.0),
                          child: Text(
                            ' K',
                            style:const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 231, 189, 150),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.cloud,
                            size: 50,
                            color: Color.fromARGB(255, 8, 95, 187),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Rain",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 231, 189, 150)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Weather Forecast",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              // const SizedBox(height: ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HourleyForecastItem(
                      time: "03.23",
                      icon: Icons.cloud,
                      temperature: "132.00",
                    ),
                    HourleyForecastItem(
                      time: "03.23",
                      icon: Icons.cloud,
                      temperature: "132.00",
                    ),
                    HourleyForecastItem(
                      time: "03.23",
                      icon: Icons.cloud,
                      temperature: "132.00",
                    ),
                    HourleyForecastItem(
                      time: "03.23",
                      icon: Icons.cloud,
                      temperature: "132.00",
                    ),
                    HourleyForecastItem(
                      time: "03.23",
                      icon: Icons.cloud,
                      temperature: "132.00",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Additional Information",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditionalInfoItem(
                        icon: Icons.water_drop_outlined,
                        label: "Humidity",
                        value: "15.3"),
                    AdditionalInfoItem(
                        icon: Icons.air, label: "WindSpeed", value: "7.3"),
                    AdditionalInfoItem(
                        icon: Icons.bubble_chart_sharp,
                        label: "Pressure",
                        value: "105.3"),
                  ],
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
               );
         },
       ),
    );
  }
}
