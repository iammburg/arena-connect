import 'package:arena_connect/screens/authentication/login.dart';
import 'package:arena_connect/homescreen.dart';
import 'package:arena_connect/screens/field-search/field_center_detail.dart';
import 'package:arena_connect/screens/field-search/select_schedule.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:arena_connect/screens/authentication/register.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const HomeScreen(),
      //   '/login': (context) => const LoginPage(),
      //   '/register': (context) => const RegisterPage(),
      // },
      // Panggil halamannya di const home ini.
      home: DeviceFrame(
        device: Devices.android.samsungGalaxyA50,
        orientation: Orientation.portrait,
        screen: Builder(
          builder:(context) => const FieldCenterDetails(),
        ),
      ),
    );
  }
}
