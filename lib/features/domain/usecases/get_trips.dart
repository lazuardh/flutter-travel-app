import 'package:dartz/dartz.dart';
import 'package:travel_apps/features/domain/entity/trip.dart';
import 'package:travel_apps/features/domain/repository/trip_repository.dart';

import '../../Core/failure.dart';

class GetTrips {
  final TripRepository repository;

  GetTrips(this.repository);

  Future<Either<Failure, List<Trip>>> call() {
    return repository.getTrip();
  }
}
