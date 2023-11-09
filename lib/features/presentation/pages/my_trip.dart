import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:travel_apps/features/presentation/providers/trip_provider.dart';

import '../widgets/costume_search.dart';
import '../widgets/travel_card.dart';

class MyTripsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ref.read(tripListNotifierProvider.notifier).loadTrips();
    final tripList = ref.watch(tripListNitifierProvider);

    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          CustomSearchBar(),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: tripList.length,
            itemBuilder: (context, index) {
              final trip = tripList[index];
              return TravelCard(
                imageUrl: trip.photos[0],
                title: trip.titile,
                description: trip.description,
                date: DateFormat.yMMMEd().format(trip.date).toString(),
                location: trip.location,
                onDelete: () {
                  ref.read(tripListNitifierProvider.notifier).removeTrip(index);
                  ref.read(tripListNitifierProvider.notifier).loadTrip();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
