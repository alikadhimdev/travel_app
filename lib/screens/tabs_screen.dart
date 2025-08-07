import 'package:flutter/material.dart';
import 'package:travel_app/screens/categories_screen.dart';
import 'package:travel_app/screens/favorite_screen.dart';

class TabScreen {
  final Widget screen;
  final String title;
  TabScreen(this.screen, this.title);
}

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

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
  final List<TabScreen> _screens = [
    TabScreen(CategoriesScreen(), "التصنيفات"),
    TabScreen(FavoriteScreen(), "المفضلة"),
  ];

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
