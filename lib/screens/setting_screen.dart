import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_drawer.dart';

class SettingScreen extends StatefulWidget {
  static const screenRoute = "/settings";
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isInSummer = false;
  bool _isInWinter = false;
  bool _isForFamily = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الاعدادات")),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 50),
                buildSwitchList(
                  "الرحلات الصيفية",
                  "عرض الرحلات الصيفية فقط",
                  _isInSummer,
                  (newValue) {
                    setState(() {
                      _isInSummer = newValue;
                    });
                  },
                ),

                SizedBox(height: 10),

                buildSwitchList(
                  "الرحلات الشتوية",
                  "عرض الرحلات الشتوية فقط",
                  _isInWinter,
                  (newValue) {
                    setState(() {
                      _isInWinter = newValue;
                    });
                  },
                ),

                SizedBox(height: 10),

                buildSwitchList(
                  "الرحلات العائلية",
                  "عرض الرحلات المناسبة للعوائل فقط",
                  _isForFamily,
                  (newValue) {
                    setState(() {
                      _isForFamily = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchList(
    String title,
    String subtitle,
    bool currentValue,
    ValueChanged<bool> updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }
}
