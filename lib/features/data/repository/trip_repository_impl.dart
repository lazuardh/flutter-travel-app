import 'package:dartz/dartz.dart';
import 'package:travel_apps/features/Core/failure.dart';
import 'package:travel_apps/features/data/datasources/trip_local_datasource.dart';
import 'package:travel_apps/features/data/models/trip_model.dart';
import 'package:travel_apps/features/domain/entity/trip.dart';
import 'package:travel_apps/features/domain/repository/trip_repository.dart';

class TripRepositoryImpl implements TripRepository {
  final TripLocalDataSource localDataSource;

  TripRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTrip(Trip trip) async {
    final tripModel = TripModel.fromEntity(trip);
    localDataSource.addTrip(tripModel);
  }

  @override
  Future<void> deleteTrip(int index) async {
    localDataSource.deleteTrip(index);
  }

  @override
  Future<Either<Failure, List<Trip>>> getTrip() async {
    try {
      final tripModel = localDataSource.getTrips();
      List<Trip> res = tripModel.map((model) => model.toEntity()).toList();
      return Right(res);
    } catch (error) {
      return Left(SomeSpecificErrors(error.toString()));
    }
  }
}
