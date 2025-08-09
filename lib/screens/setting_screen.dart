import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_drawer.dart';

class SettingScreen extends StatefulWidget {
  static const screenRoute = "/settings";
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const SettingScreen({
    super.key,
    required this.saveFilters,
    required this.currentFilters,
  });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isInSummer = false;
  bool _isInWinter = false;
  bool _isForFamily = false;

  @override
  void initState() {
    // TODO: implement initState
    _isInSummer = widget.currentFilters["summer"] ?? false;
    _isInWinter = widget.currentFilters["winter"] ?? false;
    _isForFamily = widget.currentFilters["family"] ?? false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الاعدادات"),
        actions: [
          IconButton(
            color: Colors.lightBlue,
            onPressed: () {
              final selectedFilters = {
                "summer": _isInSummer,
                "winter": _isInWinter,
                "family": _isForFamily,
              };
              widget.saveFilters(selectedFilters);
              print("save");
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
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
