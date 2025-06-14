import 'package:flightsystemlasttttt/screens/flight_search_country_screen.dart';
import 'package:flightsystemlasttttt/screens/flight_search_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FlightSearchCountryScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}