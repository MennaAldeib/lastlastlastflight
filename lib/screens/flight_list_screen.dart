import 'package:flutter/material.dart';
import '../models/flight.dart';
import 'flight_details_screen.dart';

class FlightListScreen extends StatelessWidget {
  final String fromAirport;
  final String toAirport;
  final String selectedDate;

  FlightListScreen({
    required this.fromAirport,
    required this.toAirport,
    required this.selectedDate,
  });

  final List<Flight> flights = [
    Flight(
      date: '26 August Friday 2023',
      departureTime: '10:30',
      arrivalTime: '14:25',
      price: '\$8,055',
      aircraft: 'A356V',
      flightClass: 'Extrafly Economy Class',
      departureAirport: 'IST',
      arrivalAirport: 'LGW',
    ),
    Flight(
      date: '26 August Friday 2023',
      departureTime: '11:45',
      arrivalTime: '19:30',
      price: '\$5,305',
      aircraft: 'A350',
      flightClass: 'Economy Class',
      departureAirport: 'IST',
      arrivalAirport: 'LGW',
    ),
    Flight(
      date: '26 August Friday 2023',
      departureTime: '12:20',
      arrivalTime: '15:45',
      price: '\$7,620',
      aircraft: 'B777',
      flightClass: 'Business Class',
      departureAirport: 'IST',
      arrivalAirport: 'LGW',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    String? lastDate;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with image and airports
            Container(
              height: 200,
              child: Stack(
                children: [
                  // Background image placeholder
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1436491865332-7a61a109cc05?w=800'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Overlay
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  // Content
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_sharp, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Text(
                      'Flight Search',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  // Airport codes
                  Positioned(
                    bottom: 40,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text( 
                              fromAirport,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04, // 5% of screen width,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Departure Airport',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 60,
                          child: Row(
                            children: [
                              Expanded(child: Divider(color: Colors.white70)),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Icon(Icons.flight_takeoff_rounded,
                                    color: Colors.white70, size: 16),
                              ),
                              Expanded(child: Divider(color: Colors.white70)),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              toAirport,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04, // 5% of screen width
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Arrival Airport',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ), // Flight list
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  itemCount: flights.length,
                  itemBuilder: (context, index) {
                    final flight = flights[index];
                    final showDate =
                        index == 0 || flights[index - 1].date != flight.date;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (showDate)
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, top: 16.0),
                            child: Text(
                              selectedDate,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FlightDetailsScreen(flight: flight),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 16),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: Offset(0, 2),
                                ),
                              ],
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2)),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            flight.departureTime,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          Text(
                                            'Istanbul Airport',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Container(
                                              width: 8,
                                              height: 8,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            Container(
                                              width: 40,
                                              height: 2,
                                              color: Colors.black,
                                            ),
                                            Icon(Icons.flight_takeoff,
                                                size: 16, color: Colors.black),
                                            Container(
                                              width: 40,
                                              height: 2,
                                              color: Colors.black,
                                            ),
                                            Container(
                                              width: 8,
                                              height: 8,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Direct',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            flight.arrivalTime,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          Text(
                                            'Gatwick Airport',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        'See Details',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      flight.price,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
