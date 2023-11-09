import 'package:travel_apps/features/domain/entity/trip.dart';
import 'package:travel_apps/features/domain/repository/trip_repository.dart';

class GetTrips {
  final TripRepository repository;

  GetTrips(this.repository);

  Future<Trip> call() {
    return repository.getTrip();
  }
}
