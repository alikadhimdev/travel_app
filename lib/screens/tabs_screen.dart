import 'package:flutter/material.dart';
import 'package:travel_app/screens/categories_screen.dart';
import 'package:travel_app/screens/favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            "دليل سياحي",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            dividerColor: Colors.white,
            indicatorWeight: 2,

            tabs: [
              Tab(icon: Icon(Icons.dashboard), text: "التصنيفات"),
              Tab(
                icon: Icon(Icons.star),
                text:
                    "المفضلة                                                                                                  ",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [CategoriesScreen(), FavoriteScreen()]),
      ),
    );
  }
}
