import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import the dedicated Home Screen file

// --- MAIN APP ENTRY POINT ---
void main() {
  runApp(const DivaEngineeringApp());
}

class DivaEngineeringApp extends StatelessWidget {
  const DivaEngineeringApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diva Engineering | ICT & Security Solutions Nairobi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Set up the primary color scheme and font
        primarySwatch: Colors.teal,
        fontFamily: 'Inter', // Note: You may need to add this font to your pubspec.yaml
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Color(0xFF004D40), // Dark Teal
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Define clean and professional text styles
        textTheme: const TextTheme(
          titleLarge: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16.0, color: Colors.grey),
        ),
      ),
      // Set the home screen
      home: const HomePage(), 
    );
  }
}