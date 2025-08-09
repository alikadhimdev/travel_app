import 'package:flutter/material.dart';
import "package:flutter_localizations/flutter_localizations.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/models/app_data.dart';
import 'package:travel_app/screens/setting_screen.dart';
import 'package:travel_app/screens/tabs_screen.dart';
import 'package:travel_app/screens/trip_details_screen.dart';
import '../screens/category_trips_screen.dart';
import './models/trip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "summer": false,
    "winter": false,
    "family": false,
  };

  List<Trip> _availableTrips = Trips_data;

  void _changeFilters(Map<String, bool> filtersData) {
    setState(() {
      print(filtersData);
      _filters = filtersData;
      _availableTrips = Trips_data.where((trip) {
        if (_filters["summer"] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters["winter"] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters["family"] == true && trip.isForFamilies != true) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.cairoTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),

      locale: const Locale("ar", "AE"),
      supportedLocales: const [Locale("ar", "AE"), Locale("en", "EN")],

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // home: const CategoriesScreen(),
      initialRoute: "/",
      routes: {
        "/": (ctx) => TabsScreen(),
        CategoryTripsScreen.screenRoute: (ctx) =>
            CategoryTripsScreen(availableTrips: _availableTrips),
        TripDetailsScreen.screenRoute: (ctx) => TripDetailsScreen(),
        SettingScreen.screenRoute: (ctx) => SettingScreen(
          currentFilters: _filters,
          saveFilters: _changeFilters,
        ),
      },
    );
  }
}
