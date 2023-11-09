import 'package:dartz/dartz.dart';
import 'package:travel_apps/features/domain/entity/trip.dart';

import '../../Core/failure.dart';

abstract class TripRepository {
  Future<Either<Failure, List<Trip>>> getTrip();
  Future<void> addTrip(Trip trip);
  Future<void> deleteTrip(int index);
}
