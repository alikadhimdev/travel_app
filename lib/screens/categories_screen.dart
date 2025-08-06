import 'package:flutter/material.dart';
import 'package:travel_app/widgets/category_item.dart';
import '../models/app_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(
          child: Text(
            "دليل سياحي",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),

        children: Categories_data.map(
          (item) => CategoryItem(
            imageUrl: item.imageUrl,
            title: item.title,
            id: item.id,
          ),
        ).toList(),
      ),
    );
  }
}
