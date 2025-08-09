import 'package:flutter/material.dart';
import 'package:travel_app/models/trip.dart';
import 'package:travel_app/screens/categories_screen.dart';
import 'package:travel_app/screens/favorite_screen.dart';
import 'package:travel_app/widgets/app_drawer.dart';

class TabScreen {
  final Widget screen;
  final String title;
  TabScreen(this.screen, this.title);
}

class TabsScreen extends StatefulWidget {
  final List<Trip> favoriteTrips;
  const TabsScreen({super.key, required this.favoriteTrips});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectTab(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;
  List<TabScreen> _screens = [];

  @override
  void initState() {
    // TODO: implement initState
    _screens = [
      TabScreen(CategoriesScreen(), "التصنيفات"),
      TabScreen(FavoriteScreen(favoriteTrips: widget.favoriteTrips), "المفضلة"),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Center(
          child: Text(
            _screens[_selectedScreenIndex].title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: _screens[_selectedScreenIndex].screen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "التصنيفات",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "المفضلة"),
        ],
      ),
    );
  }
}
