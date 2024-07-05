import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/contact_page.dart';
import 'screens/consult_page.dart';
import 'screens/vaccines_page.dart';
import 'screens/reminders_page.dart';

void main() {
  runApp(PetCareApp());
}

class PetCareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Pet Care App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/contact': (context) => ContactPage(),
        '/consult': (context) => ConsultPage(),
        '/vaccines': (context) => VaccinesPage(),
        '/reminders': (context) => RemindersPage(),

      },
    );
  }
}