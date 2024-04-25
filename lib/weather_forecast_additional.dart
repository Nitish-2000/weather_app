import 'package:flutter/material.dart';

class HourleyForecastItem extends StatelessWidget {
  final String time;
  final IconData icon;
  final String  temperature;
  const HourleyForecastItem({super.key,
  required this.time,
  required this.icon,
  required this.temperature

  });

  @override
  Widget build(BuildContext context) {
    return Card(
                      
                      elevation: 20,
                      color:const Color.fromARGB(255, 251, 205, 66),
                      child: Container(
                      width: 100,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                      padding:const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Text(time, style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color:Color.fromARGB(255, 119, 110, 110) ),),
                       const SizedBox(height:10),
                        Icon(icon, color:const Color.fromARGB(255, 119, 110, 110),),
                       const SizedBox(height:10),
                        Text(temperature, style:const TextStyle(fontSize: 15, color:Color.fromARGB(255, 119, 110, 110) ),),
                        const SizedBox(height:10),
                      ],
                      
                      ),
                      ),
                      );
  }
}