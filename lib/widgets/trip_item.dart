import 'package:flutter/material.dart';
import 'package:travel_app/models/app_data.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/trip_details_screen.dart';

class TripItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Season season;
  final TripType tripType;
  final String id;
  final Function removeTrip;

  const TripItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.season,
    required this.tripType,
    required this.id,
    required this.removeTrip,
  });

  String get seasonText {
    switch (season) {
      case Season.winter:
        return "الشتاء";
      case Season.spring:
        return "الربيع";
      case Season.summer:
        return "الصيف";
      case Season.autumn:
        return "الخريف";
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case (TripType.exploration):
        return "استكشاف";
      case (TripType.activities):
        return "نشاطات";
      case (TripType.recovery):
        return "نقاهة";
      case (TripType.therapy):
        return "معالجة";
    }
  }

  void selectTrip(BuildContext ctx) {
    Navigator.of(
      ctx,
    ).pushNamed(TripDetailsScreen.screenRoute, arguments: id).then((value) {
      if (value != null) {
        removeTrip(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectTrip(context),
      child: Card(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),

                  child: Image(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.fill,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Container(
                  height: 250,
                  width: double.infinity,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black12, Colors.black87],
                      stops: [0.4, 1],
                    ),
                  ),
                  child: Text(
                    title,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 5,
                    children: [
                      Icon(Icons.calendar_month, color: Colors.orange),
                      Text("$duration ايام", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      Icon(Icons.sunny, color: Colors.orangeAccent),
                      Text(seasonText, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      Icon(Icons.family_restroom, color: Colors.orangeAccent),

                      Text(tripTypeText, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
