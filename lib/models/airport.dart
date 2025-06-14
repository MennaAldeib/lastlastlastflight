class Airport {
  final String id; // airport code like LHR, CDG
  final String name; // full name like "London Heathrow Airport"
  final String? city; // city name like "London"
  final String? country; // country name like "United Kingdom"

  Airport({
    required this.id,
    required this.name,
    this.city,
    this.country,
  });

  @override
  String toString() => name;
}
