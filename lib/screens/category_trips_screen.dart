import 'package:flutter/material.dart';
import 'package:travel_app/models/app_data.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/widgets/trip_item.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = "/category_trips";
  const CategoryTripsScreen({super.key});

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  String categoryTitle = '';
  List<Trip> displayTrips = [];
  bool _didChange = false;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (!_didChange) {
      final tripArguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = tripArguments["id"];
      categoryTitle = tripArguments["title"] ?? "افتراضي";
      displayTrips = Trips_data.where((trip) {
        return trip.categories.contains(categoryId);
      }).toList();
      _didChange = true;
    }
  }

  void _removeTrip(String tripId) {
    displayTrips.removeWhere((x) => x.id == tripId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          categoryTitle,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: displayTrips.length,
        itemBuilder: (ctx, i) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: TripItem(
              id: displayTrips[i].id,
              title: displayTrips[i].title,
              imageUrl: displayTrips[i].imageUrl,
              duration: displayTrips[i].duration,
              tripType: displayTrips[i].tripType,
              season: displayTrips[i].season,
              removeTrip: _removeTrip,
            ),
          );
        },
      ),
    );
  }
}
