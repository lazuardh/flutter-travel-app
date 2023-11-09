//if ypu want api, you should rename class to TripResourcesDataRemote because it makes it easier to remember the logic

import 'package:hive/hive.dart';
import 'package:travel_apps/features/data/models/trip_model.dart';

class TripLocalDataSource {
  final Box<TripModel> tripBox;

  TripLocalDataSource(this.tripBox);

  List<TripModel> getTrips() {
    return tripBox.values.toList();
  }

  void addTrip(TripModel trip) {
    tripBox.add(trip);
  }

  void deleteTrip(int index) {
    tripBox.delete(index);
  }
}
