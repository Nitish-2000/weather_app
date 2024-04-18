
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

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
            child:  IconButton(   
            icon:const Icon(Icons.refresh),
             onPressed: (){debugPrint('hello World');},)
          )
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child:  Column(
          children: [
            SizedBox(height:15, width: 50,),
            SizedBox(
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
                elevation: 10,
                child:const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("300 Dollar",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.cloud,size:50 ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Rain",
                        style: TextStyle(
                          fontSize: 25
                        ),),
                      )
                    ],
                    
                  ),
                ) ,
              ),
            ),
        
             
        
        
             const SizedBox(height:25),

            const Align(
              alignment: Alignment.topLeft,
               child:  Text("Weather Forecast",style: TextStyle(
                    fontSize: 22,
               ),),
               
             ),
                            

            const SizedBox(height:20),

           const  Row(
              children: [
                SizedBox(
                  width: 100,
                  child :Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: [
                      Text("03.00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(height:10),
                      Icon(Icons.cloud),
                      SizedBox(height:10),
                      Text("132.0", style: TextStyle(fontSize: 15),),
                       SizedBox(height:10),
                    ],
                    
                    ),
                  ),
                  
                  

                )
              
                ),
                SizedBox(
                  width: 100,
                  child :Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: [
                      Text("03.00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(height:10),
                      Icon(Icons.cloud),
                      SizedBox(height:10),
                      Text("132.0", style: TextStyle(fontSize: 15),),
                       SizedBox(height:10),
                    ],
                    
                    ),
                  ),
                  
                  

                )
              
                ),
                SizedBox(
                  width: 100,
                  child :Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: [
                      Text("03.00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(height:10),
                      Icon(Icons.cloud),
                      SizedBox(height:10),
                      Text("132.0", style: TextStyle(fontSize: 15),),
                       SizedBox(height:10),
                    ],
                    
                    ),
                  ),
                  
                  

                )
              
                ),
                SizedBox(
                  width: 100,
                  child :Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(children: [
                      Text("03.00", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(height:10),
                      Icon(Icons.cloud),
                      SizedBox(height:10),
                      Text("132.0", style: TextStyle(fontSize: 15),),
                       SizedBox(height:10),
                    ],
                    
                    ),
                  ),
                  
                  

                )
              
                ),
                
                ],
            ),
        

             const  Placeholder( //Weather Forecast card
              fallbackHeight: 150,
              // child:  Text("Main Widget"),
            ),
        
        
            SizedBox(height:25),
        
        
            Placeholder(
              fallbackHeight: 150,
              // child:  Text("Main Widget"),
            ),
        
        ],),
      ) ,
    );
  }
}
