import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:travel_apps/features/data/datasources/trip_local_datasource.dart';
import 'package:travel_apps/features/data/models/trip_model.dart';
import 'package:travel_apps/features/data/repository/trip_repository_impl.dart';
import 'package:travel_apps/features/domain/entity/trip.dart';
import 'package:travel_apps/features/domain/usecases/add_trips.dart';
import 'package:travel_apps/features/domain/usecases/delete_trip.dart';
import 'package:travel_apps/features/domain/usecases/get_trips.dart';

import '../../domain/repository/trip_repository.dart';

final tripLocalDataSourceProvider = Provider<TripLocalDataSource>((ref) {
  final Box<TripModel> tripBox = Hive.box('trips');
  return TripLocalDataSource(tripBox);
});

final tripRepositoryProvider = Provider<TripRepository>((ref) {
  final localDataSource = ref.read(tripLocalDataSourceProvider);
  return TripRepositoryImpl(localDataSource);
});

final addTripProvider = Provider<AddTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return AddTrip(repository);
});

final getTripProvider = Provider<GetTrips>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return GetTrips(repository);
});

final deleteTripProvider = Provider<DeleteTrip>((ref) {
  final repository = ref.read(tripRepositoryProvider);
  return DeleteTrip(repository);
});

final tripListNitifierProvider =
    StateNotifierProvider<TripListNotifier, List<Trip>>((ref) {
  final getTrips = ref.read(getTripProvider);
  final addTrip = ref.read(addTripProvider);
  final deleteTrip = ref.read(deleteTripProvider);

  return TripListNotifier(getTrips, addTrip, deleteTrip);
});

class TripListNotifier extends StateNotifier<List<Trip>> {
  final GetTrips _getTrips;
  final AddTrip _addTrip;
  final DeleteTrip _deleteTrip;

  TripListNotifier(this._getTrips, this._addTrip, this._deleteTrip) : super([]);

  Future<void> addNewTrip(Trip trip) async {
    await _addTrip.call(trip);
  }

  Future<void> removeTrip(int tripId) async {
    await _deleteTrip.call(tripId);
  }

  Future<void> loadTrip() async {
    final tripOrFailure = await _getTrips();
    tripOrFailure.fold((error) => state = [], (trips) => state = trips);
  }
}
