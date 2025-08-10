import 'package:flutter/material.dart';
import 'package:travel_app/services/data_service.dart';
import 'package:travel_app/widgets/safe_network_image.dart';

class TripDetailsScreen extends StatelessWidget {
  static const screenRoute = "/trip_details";
  final Function manageFavorite;
  final Function isFavorite;
  const TripDetailsScreen({
    super.key,
    required this.manageFavorite,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = DataService.trips.firstWhere((trip) => trip.id == tripId);

    return Scaffold(
      appBar: AppBar(title: Text(selectedTrip.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeNetworkImage(
              imageUrl: selectedTrip.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),

            sectionTitle("الانشطة"),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 200,
              child: ListView.builder(
                itemCount: selectedTrip.activities.length,

                itemBuilder: (ctx, i) {
                  return Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text(selectedTrip.activities[i]),
                    ),
                  );
                },
              ),
            ),

            sectionTitle("البرنامج اليومي"),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 200,
              child: ListView.builder(
                itemCount: selectedTrip.program.length,

                itemBuilder: (ctx, i) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueAccent,

                          child: Text(
                            "يوم ${i + 1}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                        title: Text(
                          selectedTrip.program[i],
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),

            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: isFavorite(tripId) ? Colors.grey : Colors.redAccent,
        onPressed: () => manageFavorite(tripId),
        child: Icon(
          isFavorite(tripId) ? Icons.star : Icons.star_border,
          color: Colors.white,
        ),
      ),
    );
  }

  Container sectionTitle(String title) {
    return Container(
      padding: EdgeInsets.all(15),
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
          fontSize: 16,
        ),
      ),
    );
  }
}
