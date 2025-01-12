import 'package:arena_connect/screens/authentication/register.dart';
import 'package:arena_connect/screens/authentication/login.dart';
import 'package:arena_connect/homescreen.dart';
import 'package:arena_connect/screens/history/history.dart';
import 'package:arena_connect/screens/homepage/home.dart';
import 'package:arena_connect/screens/profile/profilepage.dart';
import 'package:arena_connect/screens/search/sparring_search.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:arena_connect/layouts/bottom_navigation.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/homepage': (context) => const BottomNavWrapper(child: Home()),
        '/profile': (context) => const BottomNavWrapper(child: ProfilePage()),
        '/search': (context) => const BottomNavWrapper(child: SparringSearch()),
        '/history': (context) => BottomNavWrapper(child: HistoryScreen()),
      },
    );
  }
}

class BottomNavWrapper extends StatelessWidget {
  final Widget child;

  const BottomNavWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
//
