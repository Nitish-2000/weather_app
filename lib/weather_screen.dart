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

  Future<Map<String,dynamic>> getCurrentWeather() async {
    try {
     
      const cityName = 'Chennai';
      final res = await http.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKEY"),
      );
      final data = jsonDecode(res.body);

      if (int.parse(data['cod']) != 200) {
        throw "அதுல ஒன்னு இல்ல மூடிட்டு கெளம்பு!!!!!!";
      }
     return data;
    } catch (e) {
      throw e.toString();
    }
   
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather Application',
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
                 setState(() {
                   
                 });
                },
              ))
        ],
      ),
      body:
       SingleChildScrollView(
         child: FutureBuilder(
          future: getCurrentWeather(),
           builder: (context, snapshot) {
            // print(snapshot);
            // print(snapshot.runtimeType);
            if(snapshot.connectionState== ConnectionState.waiting){
              return const  Center(child:  CircularProgressIndicator.adaptive());
            }
         
            if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString(), style:const TextStyle(fontSize: 22, color: Colors.red) ,));
            }
         
            final data = snapshot.data!;
            
         
            final currentWeather = data['list'][0]['main']['temp'];
            final String currentWeatherText = data['list'][0]['weather'][0]['main'];
            final String  humidity = data['list'][0]['main']['humidity'].toString();
            final windSpeed =  data['list'][0]['wind']['speed'].toString();
            final pressure = data['list'][0]['main']['pressure'].toString();
         
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
                              '$currentWeather K',
                              style:const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 231, 189, 150),
                              ),
                            ),
                          ),
                           Padding(
                            padding:const EdgeInsets.all(8.0),
                            child: currentWeatherText == 'Clouds' || currentWeatherText == 'Rain' ?
                              const Icon(
                              Icons.cloud,
                              size: 50,
                              color: Color.fromARGB(255, 8, 95, 187),
                            ):const Icon(
                              Icons.sunny,
                              size: 50,
                              color: Color.fromARGB(255, 8, 95, 187),
                            ) ,
                          ),
                           Padding(
                            padding:const EdgeInsets.all(8.0),
                            child: Text(
                              currentWeatherText,
                              style:const TextStyle(
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 231, 189, 150)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Future Forecast",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
         
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:20 ,
                    itemBuilder: (context, index) {
                    
                          return HourleyForecastItem(
                          time: data['list'][index]['dt_txt'],
                           icon: data['list'][index]['weather'][0]['main'] == "Clouds" || data['list'][index]['weather'][0]['main'] == "Rain" ? Icons.cloud : Icons.sunny ,
                            temperature: data['list'][index]['main']['temp'].toString(),
                            );
                    },
                  ),
                ),
         
                const SizedBox(height:10 ),
                 SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for(int i=20; i<data['list'].length; i++)
                         HourleyForecastItem(
                        time:data['list'][i]['dt_txt'] ,
                        icon:  data['list'][i]['weather'][0]['main'] == "Clouds" || data['list'][i]['weather'][0]['main'] == "Rain" ? Icons.cloud : Icons.sunny ,
                        temperature:  data['list'][i]['main']['temp'].toString(),
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
                 Padding(
                  padding:const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AdditionalInfoItem(
                          icon: Icons.water_drop_outlined,
                          label: "Humidity",
                          value: humidity),
                      AdditionalInfoItem(
                          icon: Icons.air, label: "WindSpeed", value: '$windSpeed Kms'),
                      AdditionalInfoItem(
                          icon: Icons.bubble_chart_sharp,
                          label: "Pressure",
                          value: pressure),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
                 );
           },
         ),
       ),
    );
  }
}
