import 'package:hive/hive.dart';
import 'package:travel_apps/features/domain/entity/trip.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final String titile;
  @HiveField(1)
  final List<String> photos;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final String location;

  TripModel({
    required this.titile,
    required this.photos,
    required this.description,
    required this.date,
    required this.location,
  });

  /// conversiion from Entity to model
  factory TripModel.fromEntity(Trip trip) => TripModel(
        titile: trip.titile,
        photos: trip.photos,
        description: trip.description,
        date: trip.date,
        location: trip.location,
      );

  // covertion from model to entity
  Trip toEntity() => Trip(
        titile: titile,
        photos: photos,
        description: description,
        date: date,
        location: location,
      );
}
