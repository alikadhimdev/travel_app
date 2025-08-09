import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widgets/category_item.dart';
import 'package:travel_app/widgets/trip_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Trip> favoriteTrips;
  const FavoriteScreen({super.key, required this.favoriteTrips});

  @override
  Widget build(BuildContext context) {
    if (favoriteTrips.isNotEmpty) {
      return ListView.builder(
        itemCount: favoriteTrips.length,
        itemBuilder: (ctx, i) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: TripItem(
              id: favoriteTrips[i].id,
              title: favoriteTrips[i].title,
              imageUrl: favoriteTrips[i].imageUrl,
              duration: favoriteTrips[i].duration,
              tripType: favoriteTrips[i].tripType,
              season: favoriteTrips[i].season,
              // removeTrip: _removeTrip,
            ),
          );
        },
      );
    } else {
      return Center(child: Text("ليس لديك رحلات مفضلة"));
    }
  }
}
