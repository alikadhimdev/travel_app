import 'package:flutter/material.dart';
import 'package:travel_app/models/app_data.dart';
import 'package:travel_app/widgets/trip_item.dart';

class CategoryTripsScreen extends StatelessWidget {
  static const screenRoute = "/category_trips";
  const CategoryTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tripArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = tripArguments["id"];
    final categoryTitle = tripArguments["title"];
    final filterTrip = Trips_data.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "$categoryTitle",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filterTrip.length,
        itemBuilder: (ctx, i) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: TripItem(
              id: filterTrip[i].id,
              title: filterTrip[i].title,
              imageUrl: filterTrip[i].imageUrl,
              duration: filterTrip[i].duration,
              tripType: filterTrip[i].tripType,
              season: filterTrip[i].season,
            ),
          );
        },
      ),
    );
  }
}
