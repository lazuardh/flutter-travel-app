class Trip {
  final String titile;
  final List<String> photos;
  final String description;
  final DateTime date;
  final String location;

  Trip(
      {required this.titile,
      required this.photos,
      required this.description,
      required this.date,
      required this.location});
}
