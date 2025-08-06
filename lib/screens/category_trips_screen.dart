import 'package:flutter/material.dart';

class CategoryTripsScreen extends StatelessWidget {
  const CategoryTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tripArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = tripArguments["id"];
    final categoryTitle = tripArguments["title"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(
          child: Text(
            "$categoryTitle",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(child: Text("جسم التصنيف")),
    );
  }
}
