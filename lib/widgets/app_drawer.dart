import 'package:flutter/material.dart';
import 'package:travel_app/screens/setting_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            color: Colors.orange,
            child: Text(
              "دليلك السياحي",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          listTile(Icons.home, "التصنيفات", () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          SizedBox(height: 5),
          listTile(Icons.settings, "الاعدادات", () {
            Navigator.of(
              context,
            ).pushReplacementNamed(SettingScreen.screenRoute);
          }),
        ],
      ),
    );
  }

  ListTile listTile(IconData icon, String title, Function tabFun) {
    return ListTile(
      leading: Icon(icon, color: Colors.lightBlue, size: 30),
      title: Text(title),
      onTap: () => tabFun(),
    );
  }
}
