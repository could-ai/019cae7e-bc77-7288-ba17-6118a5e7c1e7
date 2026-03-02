import 'package:flutter/material.dart';
import 'website_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LinkedIn Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // LinkedIn Blue
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0A66C2)),
        useMaterial3: true,
        // Light Grey Background typical of LinkedIn
        scaffoldBackgroundColor: const Color(0xFFF3F2EF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LinkedInHomePage(),
      },
    );
  }
}
