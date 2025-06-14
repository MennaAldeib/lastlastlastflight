import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'flight_list_screen.dart';

class FlightSearchCountryScreen extends StatefulWidget {
  @override
  _FlightSearchCountryScreenState createState() =>
      _FlightSearchCountryScreenState();
}

class _FlightSearchCountryScreenState extends State<FlightSearchCountryScreen> {
  String selectedDate = "";
  String selectedPassengers = '3 Adult, 1 Child';
  String fromCountry = "";
  String toCountry = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://cdn.discordapp.com/attachments/1233120559743766638/1383235318278393956/IMG_0540.jpg?ex=684e0dc7&is=684cbc47&hm=b892aa9a1484dd340e417ccf95f0a4e1ddaf37abae86bbb6be5bda3ebfc837aa&'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://www.echoroukonline.com/wp-content/uploads/2024/04/ghada.jpg',
                            scale: 29.9,
                          ),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Erkan Entrance',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications_outlined,
                          color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Company Slogan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'With Our Company',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'World is biggest, Discover',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Search Form
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSearchField(
                        'From',
                        fromCountry,
                        Icons.flight_takeoff,
                        () => _selectCountry(context, true),
                      ),
                      SizedBox(height: 16),
                      _buildSearchField(
                        'To',
                        toCountry,
                        Icons.flight_land,
                        () => _selectCountry(context, false),
                      ),
                      SizedBox(height: 16),
                      _buildSearchField(
                        'Flight Date',
                        selectedDate,
                        Icons.calendar_today,
                        () => _selectDate(context),
                      ),
                      Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Search Flight',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.flight, color: Colors.white),
                            ],
                          ),
                          onPressed: () {
                            String errorMessage = '';

                            if (fromCountry.isEmpty && toCountry.isEmpty) {
                              errorMessage =
                                  'Please select departure and arrival countries';
                            } else if (fromCountry.isEmpty) {
                              errorMessage = 'Please select departure country';
                            } else if (toCountry.isEmpty) {
                              errorMessage = 'Please select arrival country';
                            } else if (selectedDate.isEmpty) {
                              errorMessage = 'Please select flight date';
                            }

                            if (errorMessage.isNotEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(errorMessage),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              return;
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FlightListScreen(
                                  fromAirport: fromCountry,
                                  toAirport: toCountry,
                                  selectedDate: selectedDate,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField(
      String label, String value, IconData icon, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.grey[600]),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    value.isEmpty
                        ? (label == 'From'
                            ? 'Select departure country'
                            : label == 'To'
                                ? 'Select arrival country'
                                : label == 'Flight Date'
                                    ? 'Select travel date'
                                    : value)
                        : value,
                    style: TextStyle(
                      fontSize: 16,
                      color: value.isEmpty ? Colors.grey : Colors.black87,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 16, color: Colors.grey[400]),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        selectedDate =
            "${picked.day} ${_monthName(picked.month)} ${picked.year}";
      });
    }
  }

  String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }

  void _selectCountry(BuildContext context, bool isFrom) {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      countryListTheme: CountryListThemeData(
        flagSize: 25,
        backgroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 16, color: Colors.black87),
        bottomSheetHeight: 500,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
        ),
      ),
      onSelect: (Country country) {
        setState(() {
          if (isFrom) {
            fromCountry = country.name;
          } else {
            toCountry = country.name;
          }
        });
      },
    );
  }
}
