import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_drawer.dart';

class SettingScreen extends StatelessWidget {
  static const screenRoute = "/settings";
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الاعدادات")),
      drawer: AppDrawer(),
      body: Center(child: Text("الاعدادات")),
    );
  }
}
