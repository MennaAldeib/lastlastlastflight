import 'package:flutter/material.dart';
import '../models/flight.dart';

class FlightDetailsScreen extends StatelessWidget {
  final Flight flight;

  const FlightDetailsScreen({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header with image and back button
          Stack(
            children: [
              SizedBox(
                height: 100,
                width: double.infinity,
                child: Image.network(
                  'https://cdn.discordapp.com/attachments/1233120559743766638/1383235318278393956/IMG_0540.jpg?ex=684e0dc7&is=684cbc47&hm=b892aa9a1484dd340e417ccf95f0a4e1ddaf37abae86bbb6be5bda3ebfc837aa&',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 10,
                left: 16,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_sharp, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "Back To flights",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Details section
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Flight Details',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Lorem ipsum dolor consectetur.',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 24),

                    // Departure + Arrival Date in one box
                    _multiInfoBox([
                      _infoItem("Departure Date",
                          "${_safeDate(flight.date)} ${flight.departureTime}"),
                      _infoItem("Arrival Date",
                          "${_safeDate(flight.date)} ${flight.arrivalTime}"),
                    ]),
                    const SizedBox(height: 12),

                    // Seats + Flight Number + Terminal
                    _multiInfoBox([
                      _infoItem("Seats", "3G Adult"),
                      _infoItem("Flight Number", flight.aircraft),
                      _infoItem("Terminal", "T5 North"),
                    ]),
                    const SizedBox(height: 12),

                    // Selected Package
                    _multiInfoBox([
                      _infoItem("Selected Package", flight.flightClass),
                    ]),
                    const SizedBox(height: 24),

                    // Price
                    const Text("Total Price",
                        style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 4),
                    const Text(
                      "\$12.054",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static String _safeDate(String raw) {
    if (raw.isEmpty) return 'Unknown';
    final parts = raw.split(' ');
    return parts.isNotEmpty ? parts[0] : raw;
  }

  Widget _infoItem(String title, String value) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _multiInfoBox(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
