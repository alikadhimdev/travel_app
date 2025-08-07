import 'package:flutter/material.dart';
import "package:flutter_localizations/flutter_localizations.dart";
import 'package:travel_app/screens/categories_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/screens/setting_screen.dart';
import 'package:travel_app/screens/tabs_screen.dart';
import 'package:travel_app/screens/trip_details_screen.dart';
import '../screens/category_trips_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        CategoryTripsScreen.screenRoute: (ctx) => CategoryTripsScreen(),
        TripDetailsScreen.screenRoute: (ctx) => TripDetailsScreen(),
        SettingScreen.screenRoute: (ctx) => SettingScreen(),
      },
    );
  }
}
