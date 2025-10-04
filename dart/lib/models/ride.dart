class Ride {
  final String id;
  final String title;
  final DateTime date;
  final String route; // Could be encoded polyline or geojson

  Ride({required this.id, required this.title, required this.date, required this.route});
}
