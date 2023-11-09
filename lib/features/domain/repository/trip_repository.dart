import 'package:travel_apps/features/domain/entity/trip.dart';

abstract class TripRepository {
  Future<Trip> getTrip();
  Future<void> addTrip(Trip trip);
  Future<void> deleteTrip(int index);
}
