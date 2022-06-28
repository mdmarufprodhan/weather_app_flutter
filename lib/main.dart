import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_api_client.dart';
import 'package:weather_app/views/additional_information.dart';
import 'package:weather_app/views/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     home: HomePage()
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
WeatherApiClients client = WeatherApiClients();
  Weather? data;

  Future<void> getData() async{
    data = await client.getCurrentWeather("Bangladesh");
  }

  //but we will use a better method to call the api via
  //FutureBuilder Wid
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Weather App",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){},
          icon:Icon(Icons.menu),
          color: Colors.black,
        ),
      ),
      body: FutureBuilder(
    future: getData(),
    builder: (context , snapshot){
      if (snapshot.connectionState == ConnectionState.done){
        return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        currentWeaher(Icons.wb_sunny_rounded, "${data?.temp}", "${data?.cityName}"),
        SizedBox(
        height: 60.0,
        ),
        Text("Additional information",
        style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Divider(),
        SizedBox(height: 20,),
        additionalInformation("${data?.wind}", "${data?.pressure}", "${data?.humudity}", "${data?.feels_like}"),
    ],
    );
    }
      else if(snapshot.connectionState == ConnectionState.waiting){
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      return Container();
    }
    ));
  }
}



