import 'package:flutter/material.dart';
import 'package:travel_app/widgets/category_item.dart';
import '../services/data_service.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),

      children: DataService.categories
          .map(
            (item) => CategoryItem(
              imageUrl: item.imageUrl,
              title: item.title,
              id: item.id,
            ),
          )
          .toList(),
    );
  }
}
