import 'package:travel_apps/features/domain/entity/trip.dart';
import 'package:travel_apps/features/domain/repository/trip_repository.dart';

class AddTrip {
  final TripRepository repository;

  AddTrip(this.repository);

  Future<void> call(Trip trip) {
    return repository.addTrip(trip);
  }
}
